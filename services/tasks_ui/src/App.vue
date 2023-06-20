<script setup>
import { Authenticator } from '@aws-amplify/ui-vue';
import { reactive, onMounted } from "vue";
import { Auth } from 'aws-amplify';
import '@aws-amplify/ui-vue/styles.css';
import axios from 'axios';
import Footer from './Footer.vue';
const API_URL = import.meta.env.VITE_VUE_APP_API_URL || 'http://localhost:8000/api';

const createTaskForm = reactive({ title: '' });

const tasks = reactive({ openTasks: [], closedTasks: [] });

const createTask = async () => {
  const { idToken } = await Auth.currentSession();

  const config = { headers: { Authorization: idToken.getJwtToken() } };
  await axios.post(`${API_URL}/create-task`, { title: createTaskForm.title }, config);
  createTaskForm.title = '';
  await listOpenTasks();
};

const listOpenTasks = async () => {
  const { idToken } = await Auth.currentSession();

  const config = { headers: { Authorization: idToken.getJwtToken() } };
  const response = await axios.get(`${API_URL}/open-tasks`, config);
  tasks.openTasks = response.data.results;
};
const listClosedTasks = async () => {
  const { idToken } = await Auth.currentSession();

  const config = { headers: { Authorization: idToken.getJwtToken() } };
  const response = await axios.get(`${API_URL}/closed-tasks`, config);
  tasks.closedTasks = response.data.results;
};
const closeTask = async (id) => {
  const { idToken } = await Auth.currentSession();

  const config = { headers: { Authorization: idToken.getJwtToken() } };
  await axios.post(`${API_URL}/close-task`, { id: id }, config);
  await listOpenTasks();
  await listClosedTasks();
};
onMounted(() => {
  listOpenTasks();
  listClosedTasks();
})

</script>
<script>
export default {
  components: {
    Footer // Add the Footer component to the components option
  }
};
</script>

<template>
  <authenticator username-alias="email" :login-mechanisms="['email']">
    <template v-slot="{ signOut, user }">
      <el-menu class="el-menu" mode="horizontal" :ellipsis="false">
        <div class="flex-grow" />
        <span class="user-info">Logged in as: {{ user.attributes.email }}</span>
        <el-menu-item index="0" @click="signOut"> Sign Out</el-menu-item>
      </el-menu>

      <el-row class="form-row">
        <el-col :span="8" :offset="8">
          <el-card class="box-card">
            <el-form :model="createTaskForm" label-width="120px">
              <el-form-item label="Task Title">
                <el-input v-model="createTaskForm.title" />
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="createTask">Create</el-button>
              </el-form-item>
            </el-form>
          </el-card>
        </el-col>
      </el-row>

      <el-row class="tasks-row">
        <el-col :span="12">
          <el-card class="box-card">
            <div class="card-header">
              <h3>Open Tasks</h3>
            </div>
            <el-table :data="tasks.openTasks" class="tasks-table">
              <el-table-column prop="title" label="Title" />
              <el-table-column fixed="right" label="Actions" width="120">
                <template #default="scope">
                  <el-button link type="primary" size="large" @click="closeTask(scope.row.id)">
                    Close
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card class="box-card">
            <div class="card-header">
              <h3>Closed Tasks</h3>
            </div>
            <el-table :data="tasks.closedTasks" class="tasks-table">
              <el-table-column prop="title" label="Title" />
            </el-table>
          </el-card>
        </el-col>
      </el-row>
      <Footer />
    </template>
  </authenticator>
</template>

<style scoped>
.user-info {
  display: flex;
  align-items: center;
}

.user-info p {
  margin-right: 10px;
  color: #333;
  font-weight: 500;
}

.flex-grow {
  flex-grow: 1;
}

.form-row {
  margin-top: 20px;
}

.tasks-row {
  margin-top: 40px;
}

.box-card {
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card-header {
  background-color: #f0f2f5;
  padding: 15px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.card-header h3 {
  margin: 0;
  color: #333;
}

.tasks-table {
  margin-top: 20px;
}

.el-button {
  font-weight: 500;
}
</style>
