<template>
    <template v-if="loading">
        <m-spinner />
    </template>

    <template v-else>
        <div class="admin-update-manager p-8">
            <div v-if="!SiteSettings.enable_web_updater">
                Las actualizaciones desde la interfaz web están deshabilitadas
            </div>

            <div v-else class="">

                <button @click="runUpdate" :disabled="updating" class="bg-purple-900 px-4 py-2 text-white"
                    :class="[updating ? 'bg-gray-700' : '']">
                    {{ updating? "Updating...": "Update now" }}
                </button>



                <div class="w-full bg-gray-200 mt-4" v-if="updating">
                    <div class="bg-blue-600 text-xs font-medium text-blue-100 text-center p-1 leading-none transition-all"
                        :style="`width: ${updateProgress}%`"> {{ updateProgress }}%</div>
                </div>

                <details v-if="updating">
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
import { onMounted, ref } from 'vue';

var updating = ref(false)
var loading = ref(true)
var updateResponse = ref(null)
var outputMessage = ref([])
var currentLine = ref('')
var updateProgress = ref(0)

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
            console.log(data.value)
        }
    });
})

const runUpdate = () => {
    updating.value = true
    axios.post('/admin/upgrade')
}

</script>
