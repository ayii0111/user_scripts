// 使用方式
// const isAnimating = useHvr()
// 應在 setup() 週其中使用，不可在 onMounted()中使用，否則本檔的 onMounted 裡面的代碼不會被執行
// 傳入的參數為 refDom物件，而非 ref變數.value
// isAnimating.value = true 會運行動畫
// isAnimating.value = false 會恢復原狀

// 依賴 Hover.css 套件，且需要修改 css 檔
// 修改的 指令
// # 基礎樣式
// gsed -i -E 's/(\.[a-zA-Z0-9\.\-]+) \{/\1-init {/g' node_modules/hover.css/css/hover.css

// # 動畫樣式
// gsed -i -E 's/([a-zA-Z0-9\.\-]+):(hover|focus|active)/\1-anim/g' node_modules/hover.css/css/hover.css

import type { Ref } from 'vue'
export function useHvr(refDom: Ref<HTMLDivElement | null>, animate: string) {
  let clsInit = `hvr-${animate}-init`
  let clsAnim = `hvr-${animate}-anim`
  onMounted(() => {
    refDom.value!.classList.add(clsInit)
  })
  const isAnimating = ref<boolean | null>(null)
  watch(isAnimating, () => {
    isAnimating.value
      ? refDom.value!.classList.add(clsAnim)
      : refDom.value!.classList.remove(clsAnim)
  })

  // 當只有回傳單一物件時，不可以使用花括號
  return isAnimating
}
