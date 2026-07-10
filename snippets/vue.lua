local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  s("vsfc", {
    t({ "<script setup>", "// " }),
    i(1),
    t({ "", "</script>", "", "<template>", "  " }),
    i(2),
    t({ "", "</template>", "", "<style scoped>", "", "</style>" }),
  }),

  s("vtemp", {
    t({ "<template>", "  " }),
    i(1),
    t({ "", "</template>" }),
  }),

  s("vscript", {
    t({ "<script setup>", "  " }),
    i(1),
    t({ "", "</script>" }),
  }),

  s("vstyle", {
    t({ "<style scoped>", "  " }),
    i(1),
    t({ "", "</style>" }),
  }),

  s("vfor", {
    t("<"),
    i(1, "div"),
    t(" v-for=\"("),
    i(2, "item"),
    t(", "),
    i(3, "index"),
    t(") in "),
    i(4, "items"),
    t("\" :key=\""),
    i(3, "index"),
    t("\">"),
    i(5),
    t("</"),
    i(1),
    t(">"),
  }),

  s("vif", {
    t("<"),
    i(1, "div"),
    t(" v-if=\""),
    i(2, "condition"),
    t("\">"),
    i(3),
    t("</"),
    i(1),
    t(">"),
  }),

  s("velif", {
    t("<"),
    i(1, "div"),
    t(" v-else-if=\""),
    i(2, "condition"),
    t("\">"),
    i(3),
    t("</"),
    i(1),
    t(">"),
  }),

  s("velse", {
    t("<"),
    i(1, "div"),
    t(" v-else>"),
    i(2),
    t("</"),
    i(1),
    t(">"),
  }),

  s("vmodel", {
    t("v-model=\""),
    i(1),
    t("\""),
  }),

  s("vbind", {
    t(":"),
    i(1, "src"),
    t("=\""),
    i(2),
    t("\""),
  }),

  s("von", {
    t("@"),
    i(1, "click"),
    t("=\""),
    i(2),
    t("\""),
  }),

  s("vshow", {
    t("v-show=\""),
    i(1, "condition"),
    t("\""),
  }),

  s("vonce", {
    t("v-once"),
  }),

  s("vslot", {
    t("<slot"),
    t(">"),
    i(1),
    t("</slot>"),
  }),

  s("vnameslot", {
    t("<slot name=\""),
    i(1),
    t("\">"),
    i(2),
    t("</slot>"),
  }),

  s("vref", {
    t("const "),
    i(1, "variable"),
    t(" = ref("),
    i(2),
    t(")"),
  }),

  s("vrefv", {
    t("const "),
    i(1, "variable"),
    t(" = ref("),
    i(2),
    t(")"),
  }),

  s("vrefs", {
    t("const "),
    i(1, "variable"),
    t(" = ref(null)"),
  }),

  s("vreactive", {
    t("const "),
    i(1, "state"),
    t(" = reactive({"),
    i(2),
    t("})"),
  }),

  s("vcomp", {
    t("const "),
    i(1, "computedValue"),
    t(" = computed(() => "),
    i(2),
    t(")"),
  }),

  s("vwatch", {
    t({ "watch(" }),
    i(1, "source"),
    t({ ", (" }),
    i(2, "newVal"),
    t({ ", " }),
    i(3, "oldVal"),
    t({ ") => {", "  " }),
    i(4),
    t({ "", "})" }),
  }),

  s("vwatcheffect", {
    t({ "watchEffect(() => {", "  " }),
    i(1),
    t({ "", "})" }),
  }),

  s("vonmounted", {
    t({ "onMounted(() => {", "  " }),
    i(1),
    t({ "", "})" }),
  }),

  s("vonunmounted", {
    t({ "onUnmounted(() => {", "  " }),
    i(1),
    t({ "", "})" }),
  }),

  s("vonupdated", {
    t({ "onUpdated(() => {", "  " }),
    i(1),
    t({ "", "})" }),
  }),

  s("vnext", {
    t("await nextTick()"),
  }),

  s("vprops", {
    t("const props = defineProps({"),
    i(1),
    t("})"),
  }),

  s("vemits", {
    t("const emit = defineEmits(["),
    i(1),
    t("])"),
  }),

  s("vexpose", {
    t("defineExpose({"),
    i(1),
    t("})"),
  }),

  s("vprovide", {
    t("provide('"),
    i(1, "key"),
    t("', "),
    i(2, "value"),
    t(")"),
  }),

  s("vinject", {
    t("const "),
    i(1, "value"),
    t(" = inject('"),
    i(2, "key"),
    t("')"),
  }),

  s("vrouter", {
    t("const router = useRouter()"),
  }),

  s("vroute", {
    t("const route = useRoute()"),
  }),

}
