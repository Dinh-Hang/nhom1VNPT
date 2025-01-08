<template>
  <v-container fluid class="down-top-padding">
    <v-row>
        <v-col cols="12" sm="12">


            <BaseCard heading="Icons - Font Awesome">
                <IconFontawesome></IconFontawesome>
            </BaseCard>


        </v-col>
    </v-row>
  </v-container>
</template>

<script>

export default {
  name: "Icons",

  data: () => ({
  }),
  components: {
      IconsMaterial: () => import('@/components/vuetifyComponents/icons/IconsMaterial'),
      IconFontawesome: () => import('@/components/vuetifyComponents/icons/IconFontawesome'),
      IconColors: () => import('@/components/vuetifyComponents/icons/IconColors'),
      IconButtons: () => import('@/components/vuetifyComponents/icons/IconButtons'),
      IconClickable: () => import('@/components/vuetifyComponents/icons/IconClickable'),
      IconMdiSvg: () => import('@/components/vuetifyComponents/icons/IconMdiSvg'),
  }
};
</script>
