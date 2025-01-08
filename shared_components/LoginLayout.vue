<!--<template>-->
<!--  <div class="login-layout">-->
<!--    <slot></slot> &lt;!&ndash; Khu vực cho nội dung cụ thể (form đăng nhập) &ndash;&gt;-->
<!--  </div>-->
<!--</template>-->

<!--<script>-->
<!--export default {-->
<!--  name: 'LoginLayout',-->
<!--};-->
<!--</script>-->

<!--<style scoped>-->
<!--.login-layout {-->
<!--  display: flex;-->
<!--  justify-content: center;-->
<!--  align-items: center;-->
<!--  height: 100vh; /* Chiều cao đầy đủ của viewport */-->
<!--  background-color: #f7f7f7; /* Màu nền */-->
<!--}-->

<!--.row {-->
<!--  width: 100%; /* Chiều rộng đầy đủ */-->
<!--  max-width: 400px; /* Độ rộng tối đa */-->
<!--  margin: auto; /* Canh giữa */-->
<!--}-->

<!--.form-control {-->
<!--  margin-bottom: 15px; /* Khoảng cách giữa các trường */-->
<!--}-->

<!--.btn {-->
<!--  width: 100%; /* Nút full width */-->
<!--}-->
<!--</style>-->


<template>
  <div class="login-layout">
    <slot></slot> <!-- Khu vực cho nội dung cụ thể (form đăng nhập) -->
  </div>
</template>

<script>
export default {
  name: 'LoginLayout',
};
</script>

<style scoped>
.login-layout {
  display: flex;
  justify-content: center; /* Căn giữa theo chiều ngang */
  align-items: center; /* Căn giữa theo chiều dọc */
  height: 100vh; /* Chiều cao đầy đủ của viewport */
  background-color: #f7f7f7; /* Màu nền */
}

.row {
  width: 100%; /* Chiều rộng đầy đủ */
  max-width: 400px; /* Độ rộng tối đa */
  margin: auto; /* Canh giữa */
  padding: 20px; /* Khoảng cách bên trong */
  border: 1px solid #ccc; /* Viền bao quanh */
  border-radius: 5px; /* Bo tròn góc */
  background-color: white; /* Màu nền của form */
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ */
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

