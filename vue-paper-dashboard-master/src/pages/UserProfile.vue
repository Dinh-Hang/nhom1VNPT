<!--<template>-->
<!--  <div class="row">-->
<!--    <div class="col-xl-4 col-lg-5 col-md-6">-->
<!--      <user-card> </user-card>-->
<!--      <members-card> </members-card>-->
<!--    </div>-->
<!--    <div class="col-xl-8 col-lg-7 col-md-6">-->
<!--      <edit-profile-form> </edit-profile-form>-->
<!--    </div>-->
<!--  </div>-->
<!--</template>-->
<!--<script>-->
<!--import EditProfileForm from "./UserProfile/EditProfileForm.vue";-->
<!--import UserCard from "./UserProfile/UserCard.vue";-->
<!--import MembersCard from "./UserProfile/MembersCard.vue";-->
<!--export default {-->
<!--  components: {-->
<!--    EditProfileForm,-->
<!--    UserCard,-->
<!--    MembersCard,-->
<!--  },-->
<!--};-->
<!--</script>-->
<!--<style></style>-->

<template>

  <div class="container" id="main">

    <form v-on:submit.prevent="postTaiKhoan">
      <div class="card mb-auto">
        <div class="card-header" @click="toggleForm" style="cursor: pointer">
          <div class="float-left">Thêm/Sửa Tài Khoản</div>
          <div class="float-right">{{ formVisible ? '-' : '+' }}</div>
        </div>
        <div class="card card-body" v-show="formVisible">
          <div class="form-group row">
            <label for="masv" class="col-sm-4 col-form-label">Mã Sinh Viên</label>
            <input id="masv" class="form-control col-sm-8" placeholder="Mã sinh viên"
                   type="text"
                   v-model="masv"/>
          </div>
          <div class="form-group row">
            <label for="hoten" class="col-sm-4 col-form-label">Họ tên</label>
            <input id="hoten" class="form-control col-sm-8" placeholder="Họ tên "
                   type="text"
                   v-model="hoten"/>
          </div>
          <div class="form-group row">
            <label for="password" class="col-sm-4 col-form-label">Password</label>
            <input id="password" class="form-control col-sm-8" placeholder="password "
                   type="password"
                   v-model="password"/>
          </div>
          <div class="form-group row">
            <label for="malop" class="col-sm-4 col-form-label">Mã Lớp</label>
            <input id="malop" class="form-control col-sm-8" placeholder="Mã Lớp"
                   type="text"
                   v-model="malop"/>
          </div>
          <div class="form-group row">
            <div class="col col-sm-4"></div>
            <input class="btn btn-primary col col-sm-8" type="submit" value="Lưu">
          </div>
        </div>
      </div>
    </form>

    <br><br>

    <table class="table table-striped table-bordered">
      <thead>
      <tr align="center">
<!--        <th>STT</th>-->
        <th>Mã SV</th>
        <th>Họ tên</th>
        <th>Password</th>
        <th>Mã Lớp </th>
        <th>Quản Lý </th>
      </tr>
      </thead>
      <tbody>
      <tr align="center" v-for="sinhvien in sinhviens" :key="sinhvien.masv">
        <td>{{ sinhvien.masv }}</td>
        <td>{{ sinhvien.hoten }}</td>
        <td>{{ sinhvien.password }}</td>
        <td>{{ sinhvien.malop }}</td>
        <td align="center">
          <button class="btn btn-primary" v-on:click="editTaiKhoan(sinhvien)">Sửa</button>
          <button class="btn btn-danger" v-on:click="deleteTaiKhoan(sinhvien)">Xóa</button>
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
      sinhviens: '',
      masv: '',
      hoten: '',
      password: '',
      malop: ''
    };
  },
  mounted() {
    this.getSinhViens();
  },
  methods: {
    toggleForm() {
      this.formVisible = !this.formVisible;
    },
    getSinhViens() {
      axios.get(`${API_BASE_URL}/api/v1/taikhoans`).then(response => (this.sinhviens = response.data));// axios.get('${API_BASE_URL}/api/v1/members').then(response => (this.members = response.data));

    },
    editTaiKhoan(taikhoan) {
      this.masv = taikhoan.masv;
      this.hoten = taikhoan.hoten;
      this.password = taikhoan.password;
      this.malop = taikhoan.malop;
      this.formVisible = true;
    },
    postTaiKhoan() {
      const payload = {
        masv: this.masv,
        hoten: this.hoten,
        password: this.password,
        gioitinh:  false, // Mặc định là `false`
        diachi:  "Chưa cập nhật",
        ngaysinh: "",
        malop: this.malop,
        danghihoc:  false, // Mặc định là `false`
        cccd: "",
        chuyennganh: ""
      };
      if (this.masv && this.isUpdating) {
        axios.put(`${API_BASE_URL}/api/v1/update-taikhoan/${this.masv}`, payload).then(() => {
          this.getSinhViens();
          this.resetForm();
        }).catch(error => {
          console.error("Lỗi khi thêm tài khoản:", error.response?.data || error.message);
        });
      } else {
        axios.post(`${API_BASE_URL}/api/v1/add-new-taikhoan`, payload).then(response => {
          this.sinhviens.push(response.data);
          this.resetForm();
        }).catch(error => {
          console.error("Lỗi khi thêm tài khoản:", error.response?.data || error.message);
        });
      }
    },
    deleteTaiKhoan(sinhvien) {
      const confirmLogout = window.confirm("Bạn có chắc chắn muốn xóa không?");
      if (confirmLogout) {
        axios.delete(`${API_BASE_URL}/api/v1/taikhoan/${sinhvien.masv}`).then(() => this.getSinhViens())
          .catch(error => {
            console.error("Lỗi khi xóa tài khoản:", error.response?.data || error.message);
          });
      }
    },
    resetForm() {
      this.masv = '';
      this.hoten = '';
      this.password = '';
      this.malop = '';
      this.isUpdating = false;
    }
  }
};
</script>
