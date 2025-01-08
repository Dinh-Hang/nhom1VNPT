<template>
  <v-app-bar app clipped-left clipped-right color="primary" dark>
    <v-toolbar-title class="align-center d-flex">
      <span class="logo-icon">
        <img src="../../assets/logo-light-icon.png" />
      </span>
      <span class="logo-text ml-2">
        Tên SINH VIÊN
<!--        <img src="../../assets/logo-light-text.png" class="mt-2" />-->
      </span>
    </v-toolbar-title>
    <v-app-bar-nav-icon
      class="d-block d-md-none"
      @click="$vuetify.breakpoint.smAndDown ? setSidebarDrawer(!Sidebar_drawer) : $emit('input', !value)"
    />
    <v-spacer />
    <!---right part -->
<!--    <v-btn dark color="success" href="https://www.wrappixel.com/templates/materialpro-vuetify-admin/">Upgrade to Pro</v-btn>-->
    <v-menu bottom left transition="scale-transition">
      <template v-slot:activator="{ on }">
        <v-btn dark icon v-on="on">
          <v-icon>mdi-dots-vertical</v-icon>
        </v-btn>
      </template>

      <v-list>
        <v-list-item v-for="(item, i) in userprofile" :key="i" @click="href(item.title)">
          <v-list-item-title>{{ item.title }}</v-list-item-title>
        </v-list-item>
      </v-list>
    </v-menu>
  </v-app-bar>
</template>
<script>
// Utilities
import { mapState, mapMutations } from "vuex";
export default {
  name: "Header",

  components: {},

  props: {
    value: {
      type: Boolean,
      default: false
    }
  },
  data: () => ({
    userprofile: [
      { title: "My Profile" },
      { title: "My Balance" },
      { title: "Inbox" },
      { title: "Account Setting" },
      { title: "Logout" }
    ],
    // href() {
    //   return undefined;
    // }
  }),

  computed: {
    ...mapState(["Sidebar_drawer"])
  },

  methods: {
    ...mapMutations({
      setSidebarDrawer: "SET_SIDEBAR_DRAWER"
    }),
    async handleLogout() {
      const confirmLogout = window.confirm("Bạn có chắc chắn muốn đăng xuất không?");
      if (confirmLogout) {
        try {
          // Xóa cookie
          document.cookie = "token=; path=/; domain=localhost; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
          document.cookie = "role=; path=/; domain=localhost; expires=Thu, 01 Jan 1970 00:00:00 UTC;";

          console.log("Đã logout, cookie đã bị xóa!");

          // Điều hướng về trang login
          window.location.href = "http://localhost:8080/login";
        } catch (error) {
          console.error("Lỗi khi logout:", error);
        }
      }
    },
    href(itemTitle) {
      if (itemTitle === "Logout") {
        this.handleLogout();
      } else {
        alert(`Đã chọn: ${itemTitle}`);
      }
    }
  }
};
</script>
