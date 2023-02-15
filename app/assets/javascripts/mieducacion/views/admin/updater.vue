<template>
    <template v-if="loading">
        <m-spinner />
    </template>

    <template v-else>
        <div class="admin-update-manager">
            <button @click="runUpdate" :disabled="updating" class="bg-purple-900 px-4 py-2 text-white" v-if="updateResponse.updates_available"
                :class="[updating ? 'bg-gray-700' : '']">
                {{ updating? "Updating...":  "Update now" }}
            </button>

            <progress v-if="updating" :value="updateProgress" max="100">
            
            </progress>

            <div v-if="updating" class="terminal-updating">
                <template v-for="line in outputMessage">
                    {{ line }}
                </template>


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
var updateProgress = ref(null)


onMounted(() => {
        axios.get('/admin/updates.json')
        .then(response => {
            loading.value = false
            updateResponse.value = response.data
        })

        MessageBus.subscribe("/admin/upgrade", (data) => {
            if(data.type == "percent") {
                updateProgress.value = data.value
            }
            if(data.type == "log") {
                outputMessage.value.push(data.value)
            }
            console.log(data)

      });
})

const runUpdate = () => {
    updating.value = true
    axios.post('/admin/upgrade')
}

</script>
