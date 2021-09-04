import { defineConfig } from 'vite'

export default defineConfig({
  slidev: {
    // vue: {
    //    vue параметры 
    // },
    markdown: {
      /* markdown-it параметры */
      markdownItSetup(md) {
        /* кастомные markdown-it плагины */
        md.use(require('markdown-it-plantuml'))
      },
    },
    /* параметры для других плагинов */
  },
})