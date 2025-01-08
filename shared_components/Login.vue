<!--<template>-->
<!--  <LoginLayout>-->
<!--    <div class="row">-->

<!--      <form @submit.prevent="LoginData">-->
<!--        <div class="form-control">-->
<!--          <label>MÃ SV</label>-->
<!--          <input type="text" v-model="employee.masv" class="form-control" required>-->
<!--        </div>-->
<!--        <div class="form-control">-->
<!--          <label>Password</label>-->
<!--          <input type="password" v-model="employee.password" class="form-control" required>-->
<!--        </div>-->
<!--        <button type="submit" class="btn"> ĐĂNG NHẬP </button>-->
<!--      </form>-->
<!--    </div>-->
<!--  </LoginLayout>-->
<!--</template>-->


<template>
  <LoginLayout>
    <div class="row">
      <form @submit.prevent="LoginData" >
        <div class="form-group">
          <label for="masv">MÃ SV</label>
          <input type="text" v-model="employee.masv" class="form-control" id="masv" required>
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" v-model="employee.password" class="form-control" id="password" required>
        </div>
        <button type="submit" class="btn btn-primary btn-block"> ĐĂNG NHẬP </button>
      </form>
    </div>
  </LoginLayout>
</template>

<script>
import axios from 'axios';
import LoginLayout from "./LoginLayout.vue";

export default {
  name: 'LoginComponent',
  components: {LoginLayout},
  data() {
    return {
      employee: {
        masv: '',
        password: ''
      }
    }
  },
  created() {
  },
  mounted() {
    console.log("mounted() called.........");
  },



//   methods: {
//
//     async LoginData() {
//       try {
//         const response = await axios.post("http://localhost:8090/api/v1/user/login",
//           this.employee
//         );
//         // if (response.data.valid) {
//         //   next();
//         // } else {
//         //   throw new Error("Token không hợp lệ");
//         // }
//         const { message, token, role } = response.data;
//
//         if (message === "Login Success") {
//           localStorage.setItem("token", token);
//           localStorage.setItem("role", role);
//           console.log("Token:", localStorage.getItem("token"));
//           console.log("Role:", localStorage.getItem("role"));
//           //this.login(); // Gọi action login để cập nhật trạng thái
//           // Chuyển hướng dựa trên vai trò
//           if (role === "admin") {
//             window.location.href = "http://localhost:8081";
//           } else if (role === "user") {
//             window.location.href = "http://localhost:8085";
//           }
//         } else {
//           alert(message);
//         }
//       } catch (error) {
//         alert("Đăng nhập thất bại. Vui lòng thử lại!");
//         console.error(error);
//       }
//     },
//   }
//
// }
  methods: {
    async LoginData() {
      try {
        const response = await axios.post("http://localhost:8090/api/v1/user/login", this.employee);
        const {message, token, role} = response.data;

        if (message === "Login Success") {
          // Lưu token và role vào cookie
          document.cookie = `token=${token}; path=/; domain=localhost; secure`;
          document.cookie = `role=${role}; path=/; domain=localhost; secure`;

          console.log("Token và Role được lưu vào cookie");

          // Chuyển hướng dựa trên vai trò
          if (role === "admin") {
            window.location.href = "http://localhost:8081";
          } else if (role === "user") {
            window.location.href = "http://localhost:8080";
          }
        } else {
          alert(message);
        }
      } catch (error) {
        alert("Đăng nhập thất bại. Vui lòng thử lại!!");
        console.error(error);
      }
    }
  }
}

</script>
<style scoped>
.row {
  width: 100%; /* Chiều rộng đầy đủ */
  max-width: 500px; /* Độ rộng tối đa */
  margin: auto; /* Canh giữa */
}
.form-group {
  display: flex; /* Sử dụng flex để căn giữa */
  flex-direction: column; /* Sắp xếp theo chiều dọc */
  margin-bottom: 15px; /* Khoảng cách giữa các trường */
}

.form-control {
  width: 100%; /* Đảm bảo ô input có chiều rộng 100% */
  padding: 10px; /* Khoảng cách bên trong cho ô input */
  border: 1px solid #ccc; /* Đường viền cho ô input */
  border-radius: 4px; /* Bo tròn góc cho ô input */
  box-shadow: none; /* Xóa đổ bóng mặc định */
}

</style>
