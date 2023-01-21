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
        </div>
    </template>

</template>

<script setup>
import { onMounted, ref } from 'vue';

var updating = ref(false)
var loading = ref(true)
var updateResponse = ref(null)

onMounted(() => {
        axios.get('/admin/updates.json')
        .then(response => {
            loading.value = false
            updateResponse.value = response.data
        })
})

function runUpdate() {
    updating.value(true)
    axios.post('/admin/upgrade')
}

</script>
