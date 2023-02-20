<template>
    <template v-if="loading">
        <m-spinner />
    </template>

    <template v-else>
        <div class="admin-update-manager sm:p-8 p-2">
            <div v-if="!SiteSettings.enable_web_updater">
                {{ js.admin.updater.web_updater_disabled }}
            </div>

            <div v-else class="">

                <section id="web-updater-landing" class="text-center">
                    <img :src="ReadyIllustration" class="sm:w-3/6 mx-auto" :alt="t('js.admin.updater.ready_title')">
                    <span class="bg-blue-100 rounded-full px-2 py-1 text-blue-700 text-sm font-medium
                                                ">Experimental</span>
                    <h2 class="text-xl font-medium text-gray-900 mt-2">{{ t('js.admin.updater.ready_title') }}

                    </h2>
                    <p class="max-w-2xl text-center mx-auto mt-2">
                        {{ t('js.admin.updater.ready_description') }}
                    </p>

                </section>

                <button @click="runUpdate" :disabled="updating"
                    class="bg-purple-900 mx-auto px-4 py-2 mt-4 flex justify-center text-white"
                    :class="[updating ? '!bg-gray-700' : '']">
                    {{ updating ? "Updating..." : "Update now" }}
                </button>


                <section id="update-failed" class="mx-2 bg-red-500 px-4 py-2" v-if="updateStatus === 'failed'">

                </section>
                <div class="w-full bg-gray-200 mt-4" v-if="updating">
                    <div class="bg-blue-600 text-xs font-medium text-blue-100 text-center p-1 leading-none transition-all"
                        :style="`width: ${updateProgress}%`"> {{ updateProgress }}%</div>
                </div>

                <details id="expandable-logs" v-if="updating">
                    <summary>{{ currentLine }}</summary>
                    <div v-if="updating" class="terminal-updating">
                        <template v-for="line in outputMessage">
                            {{ line }}
                        </template>


                    </div>
                </details>

            </div>
        </div>
    </template>
</template>

<script setup>
import ReadyIllustration from 'images/illustrations/ready-for-update.svg';

import { onMounted, ref } from 'vue';
import { AlertTriangle } from 'lucide-vue-next';

var updating = ref(false)
var loading = ref(true)
var updateResponse = ref(null)
var outputMessage = ref([])
var currentLine = ref('')
var updateProgress = ref(0)
var updateStatus = ref(null)

const handleFailed = () => {
    let expandableLogs = getElementById("expandable-logs")
    MessageBus.unsubscribe('/admin/upgrade')
    currentLine.value = 'Failed to update MiEducación';
    expandableLogs.setAttribute("open", "true");
}

onMounted(() => {
    axios.get('/admin/updates.json')
        .then(response => {
            loading.value = false
            updateResponse.value = response.data
        })

    MessageBus.subscribe("/admin/upgrade", (data) => {
        if (data.type == "percent") {
            updateProgress.value = data.value
        }
        if (data.type == "log") {
            outputMessage.value.push(data.value)
            currentLine.value = data.value
        }
        if (data.type == "status") {
            updateStatus.value = data.value
            console.log(data.value)
            if (data.value == "failed") {
                handleFailed()
            }
        }
    });
})

const runUpdate = () => {
    updating.value = true
    axios.post('/admin/upgrade')
        .then(response => {
            if (response.data.error_type === "no_updates_available") {
                updating.value = false
            }
        })
</script>
