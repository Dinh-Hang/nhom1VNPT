<!--<template>-->
<!--  <div class="row">-->
<!--    <div class="col-12">-->
<!--      <card :title="table1.title" :subTitle="table1.subTitle">-->
<!--        <div slot="raw-content" class="table-responsive">-->
<!--          <paper-table :data="table1.data" :columns="table1.columns">-->
<!--          </paper-table>-->
<!--        </div>-->
<!--      </card>-->
<!--    </div>-->

<!--    <div class="col-12">-->
<!--      <card class="card-plain">-->
<!--        <div class="table-full-width table-responsive">-->
<!--          <paper-table-->
<!--            type="hover"-->
<!--            :title="table2.title"-->
<!--            :sub-title="table2.subTitle"-->
<!--            :data="table2.data"-->
<!--            :columns="table2.columns"-->
<!--          >-->
<!--          </paper-table>-->
<!--        </div>-->
<!--      </card>-->
<!--    </div>-->
<!--  </div>-->
<!--</template>-->
<!--<script>-->
<!--import { PaperTable } from "@/components";-->
<!--const tableColumns = ["Id", "Name", "Salary", "Country", "City"];-->
<!--const tableData = [-->
<!--  {-->
<!--    id: 1,-->
<!--    name: "Dakota Rice",-->
<!--    salary: "$36.738",-->
<!--    country: "Niger",-->
<!--    city: "Oud-Turnhout",-->
<!--  },-->
<!--  {-->
<!--    id: 2,-->
<!--    name: "Minerva Hooper",-->
<!--    salary: "$23,789",-->
<!--    country: "Curaçao",-->
<!--    city: "Sinaai-Waas",-->
<!--  },-->
<!--  {-->
<!--    id: 3,-->
<!--    name: "Sage Rodriguez",-->
<!--    salary: "$56,142",-->
<!--    country: "Netherlands",-->
<!--    city: "Baileux",-->
<!--  },-->
<!--  {-->
<!--    id: 4,-->
<!--    name: "Philip Chaney",-->
<!--    salary: "$38,735",-->
<!--    country: "Korea, South",-->
<!--    city: "Overland Park",-->
<!--  },-->
<!--  {-->
<!--    id: 5,-->
<!--    name: "Doris Greene",-->
<!--    salary: "$63,542",-->
<!--    country: "Malawi",-->
<!--    city: "Feldkirchen in Kärnten",-->
<!--  },-->
<!--];-->

<!--export default {-->
<!--  components: {-->
<!--    PaperTable,-->
<!--  },-->
<!--  data() {-->
<!--    return {-->
<!--      table1: {-->
<!--        title: "Stripped Table",-->
<!--        subTitle: "Here is a subtitle for this table",-->
<!--        columns: [...tableColumns],-->
<!--        data: [...tableData],-->
<!--      },-->
<!--      table2: {-->
<!--        title: "Table on Plain Background",-->
<!--        subTitle: "Here is a subtitle for this table",-->
<!--        columns: [...tableColumns],-->
<!--        data: [...tableData],-->
<!--      },-->
<!--    };-->
<!--  },-->
<!--};-->
<!--</script>-->
<!--<style></style>-->
<template>

  <div class="container" id="main">

    <form v-on:submit.prevent="postProject">
      <div class="card mb-auto">
<!--        <div aria-controls="projectForm" aria-expanded="false" class="card-header" data-target="#projectForm"-->
<!--             data-toggle="collapse" id="formHeader" style="cursor: pointer">-->
<!--          <div class="float-left">New/Edit Project</div>-->
<!--          <div class="float-right">+</div>-->
<!--        </div>-->
<!--        <div class="card card-body collapse" id="projectForm">-->
        <div class="card-header" @click="toggleForm" style="cursor: pointer">
          <div class="float-left">Thêm/Sửa Project</div>
          <div class="float-right">{{ formVisible ? '-' : '+' }}</div>
        </div>
        <div class="card card-body" v-show="formVisible">
          <div class="form-group row">
            <label for="projectName" class="col-sm-4 col-form-label">Project title</label>
            <input id="project_id" type="hidden" v-model="project_id">
            <input id="projectName" class="form-control col-sm-8" placeholder="Project title" type="text"
                   v-model="project_name"/>
          </div>
          <div class="form-group row">
            <label for="project_description" class="col-sm-4 col-form-label">Project description</label>
            <input id="project_description" class="form-control col-sm-8" placeholder="Project description"
                   type="text"
                   v-model="project_description"/>
          </div>
          <div class="form-group row">
            <label for="project_members_id" class="col-sm-4 col-form-label">Team members</label>
            <select name="project_member_id" id="project_members_id" v-model="project_member_id">
              <option disabled value="">Please select a Team Member</option>
              <option
                :selected="member.teamMemberid == project_member_id"
                :value="member.teamMemberid"
                v-for="member in members"
                :key="member.teamMemberid">
                {{ member.teamMemberLastName }} {{ member.teamMemberFirstName }}
              </option>
            </select>
          </div>
          <div class="form-group row">
            <label for="project_statuses_id" class="col-sm-4 col-form-label">Status</label>
            <select name="project_status_id" id="project_statuses_id" v-model="project_status_name">
              <option disabled value="">Please select the Status</option>
              <option
                :selected="status.statusName == project_status_name"
                :value="status.statusName"
                v-for="status in statuses"
                :key="status.statusName">
                {{ status.statusName }}
              </option>
            </select>
          </div>
          <div class="form-group row">
            <div class="col col-sm-4"></div>
            <input class="btn btn-primary col col-sm-8" type="submit" value="Save">
          </div>
        </div>
      </div>
    </form>

    <br><br>

    <table class="table table-striped table-bordered">
      <thead>
      <tr align="center">
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Status</th>
        <th>Assignee</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <tr align="center" v-for="project in projects" :key="project.projectId">
        <td>{{ project.projectId }}</td>
        <td>{{ project.projectName }}</td>
        <td>{{ project.description }}</td>
        <td>{{ project.statusName }}</td>
        <td>{{ project.teamMemberOfProjectLastName }} {{ project.teamMemberOfProjectFirstName }}</td>
        <td align="center">
          <button class="btn btn-primary" v-on:click="editProject(project)">Edit</button>
          <button class="btn btn-danger" v-on:click="deleteProject(project)">Delete</button>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
import axios from 'axios';
import { API_BASE_URL } from '../cong';
export default {
  data() {
    return {
      formVisible: false,
      projects: '',
      members: '',
      statuses: '',
      project_id: '',
      project_name: '',
      project_description: '',
      project_member_id: '',
      project_status_name: ''
    };
  },
  mounted() {
    this.getProjects();
  },
  methods: {
    toggleForm() {
      this.formVisible = !this.formVisible;
    },
    getProjects() {
      axios.get(`${API_BASE_URL}/api/v1/projects`).then(response => (this.projects = response.data));
      // axios.get('${API_BASE_URL}/api/v1/members').then(response => (this.members = response.data));
      axios.get(`${API_BASE_URL}/api/v1/status`).then(response => (this.statuses = response.data));
    },
    editProject(project) {
      this.project_id = project.project_id;
      this.project_name = project.projectName;
      this.project_description = project.description;
      this.project_member_id = project.teamMemberId;
      this.project_status_name = project.statusName;
      this.formVisible = true;
    },
    postProject() {
      const payload = {
        projectName: this.project_name,
        description: this.project_description,
        teamMemberId: this.project_member_id,
        statusName: this.project_status_name
      };
      if (this.project_id) {
        axios.put(`${API_BASE_URL}/api/v1/update-project/${this.project_id}`, payload).then(() => {
          this.getProjects();
          this.resetForm();
        });
      } else {
        axios.post(`${API_BASE_URL}/api/v1/add-new-project`, payload).then(response => {
          this.projects.push(response.data);
          this.resetForm();
        });
      }
    },
    deleteProject(project) {
      axios.delete(`${API_BASE_URL}/api/v1/project/${project.projectId}`).then(() => this.getProjects());
    },
    resetForm() {
      this.project_id = '';
      this.project_name = '';
      this.project_description = '';
      this.project_member_id = '';
      this.project_status_name = '';
    }
  }
};
</script>
