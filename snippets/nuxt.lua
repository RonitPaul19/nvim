local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  s("npage", {
    t({ "<template>", "  " }),
    i(1),
    t({ "", "</template>", "", "<script setup lang=\"ts\">", "definePageMeta({", "  " }),
    i(2),
    t({ "", "})", "", "const " }),
    i(3),
    t({ "", "</script>" }),
  }),

  s("nlayout", {
    t({ "<template>", "  <div>", "    <slot />", "  </div>", "</template>", "", "<script setup lang=\"ts\">", "// " }),
    i(1),
    t({ "", "</script>" }),
  }),

  s("ncomposable", {
    t({ "export const use" }),
    i(1, "Feature"),
    t({ " = () => {", "  const " }),
    i(2, "data"),
    t({ " = ref(" }),
    i(3),
    t({ ")", "", "  return { " }),
    i(2),
    t({ " }", "}" }),
  }),

  s("nplugin", {
    t({ "export default defineNuxtPlugin(() => {", "  " }),
    i(1),
    t({ "", "})" }),
  }),

  s("nmiddleware", {
    t({ "export default defineNuxtRouteMiddleware((to, from) => {", "  " }),
    i(1),
    t({ "", "})" }),
  }),

  s("nserver", {
    t({ "export default defineEventHandler(async (event) => {", "  " }),
    i(1),
    t({ "", "})" }),
  }),

  s("nusefetch", {
    t("const { data: "),
    i(1, "data"),
    t(", pending, error, refresh } = await useFetch('"),
    i(2, "/api/endpoint"),
    t("'"),
    i(3),
    t(")"),
  }),

  s("nuselazyfetch", {
    t("const { data: "),
    i(1, "data"),
    t(", pending, error, refresh } = useLazyFetch('"),
    i(2, "/api/endpoint"),
    t("'"),
    i(3),
    t(")"),
  }),

  s("nuseasyncdata", {
    t("const { data: "),
    i(1, "data"),
    t(", pending, error, refresh } = await useAsyncData('"),
    i(2, "key"),
    t("', () => $fetch('"),
    i(3, "/api/endpoint"),
    t("'))"),
  }),

  s("nuselazyasyncdata", {
    t("const { data: "),
    i(1, "data"),
    t(", pending, error, refresh } = useLazyAsyncData('"),
    i(2, "key"),
    t("', () => $fetch('"),
    i(3, "/api/endpoint"),
    t("'))"),
  }),

  s("nconfig", {
    t("const config = useRuntimeConfig()"),
  }),

  s("nstate", {
    t("const "),
    i(1, "value"),
    t(" = useState('"),
    i(1),
    t("', () => "),
    i(2),
    t(")"),
  }),

  s("ncookie", {
    t("const "),
    i(1, "cookie"),
    t(" = useCookie('"),
    i(1),
    t("')"),
  }),

  s("nhead", {
    t({ "useHead({", "  title: '" }),
    i(1, "Page Title"),
    t({ "',", "  meta: [", "    { name: 'description', content: '" }),
    i(2, "Description"),
    t({ "' }", "  ]", "})" }),
  }),

  s("nseo", {
    t({ "useSeoMeta({", "  title: '" }),
    i(1, "Page Title"),
    t({ "',", "  ogTitle: '" }),
    i(1),
    t({ "',", "  description: '" }),
    i(2, "Description"),
    t({ "',", "  ogDescription: '" }),
    i(2),
    t({ "',", "})" }),
  }),

  s("nnavigate", {
    t("await navigateTo('"),
    i(1),
    t("')"),
  }),

  s("npagemeta", {
    t({ "definePageMeta({", "  " }),
    i(1),
    t({ "", "})" }),
  }),

  s("napp", {
    t({ "<template>", "  <div>", "    <NuxtLayout>", "      <NuxtPage />", "    </NuxtLayout>", "  </div>", "</template>" }),
  }),

  s("nerror", {
    t({ "<template>", "  <div>", "    <h1>{{ error.statusCode }}</h1>", "    <p>{{ error.message }}</p>", "    <button @click=\"handleError\">Go Home</button>", "  </div>", "</template>", "", "<script setup lang=\"ts\">", "const props = defineProps({", "  error: Object", "})", "", "const handleError = () => clearError({ redirect: '/' })", "</script>" }),
  }),

}
