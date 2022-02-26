import{URL,isJson,newTokenData,loginMdl}from"./script.js";const articleId=document.querySelector("[name='article_id']").value,toast=document.getElementById("message-toast"),toastBody=toast.querySelector(".toast-body");function isInViewport(t){const e=t.getBoundingClientRect();return e.top>=0||e.bottom>=500}function toggleActions(){const t=document.querySelector(".fixed-action-bar"),e=document.querySelector(".show-fixed-bar");isInViewport(e)||isInViewport(e)?t.style.visibility="visible":t.style.visibility="hidden"}document.querySelectorAll(".content-area pre").forEach(t=>hljs.highlightBlock(t)),document.addEventListener("scroll",toggleActions,{passive:!0}),toggleActions(),document.addEventListener("click",function(t){const e=t.target.classList,o=newTokenData({article_id:articleId});if(toastBody.innerHTML="",e.contains("react-written")||e.contains("react-interesting")||e.contains("react-confused")){let t;t=e.contains("react-written")?"well-written":e.contains("react-interesting")?"interesting":"confused",o.append("type",t),fetch(`${URL}/ajax/article/toggle-reaction`,{method:"POST",body:o}).then(t=>t.text()).then(e=>{if(isJson(e)){if(200===JSON.parse(e).status){"well-written"===t&&(t="written");const e="true"===document.querySelector(`.react-${t}-count`).getAttribute("data-toggle"),o=parseInt(document.querySelector(`.react-${t}-count`).getAttribute("data-count"));document.querySelectorAll(`button.react-${t}`).forEach(t=>{t.classList.toggle("reacted")}),document.querySelectorAll(`.count-${t}`).forEach(n=>{const c=e?o-1:o+1;n.innerHTML=c,document.querySelector(`.react-${t}-count`).setAttribute("data-count",c),document.querySelector(`.react-${t}-count`).setAttribute("data-toggle",!e)})}}else loginMdl()})}}),document.querySelectorAll(".toggle-bookmark").forEach(t=>{t.addEventListener("click",()=>{const t=newTokenData({article_id:articleId});fetch(`${URL}/ajax/article/toggle-bookmark`,{method:"POST",body:t}).then(t=>t.text()).then(t=>{isJson(t)?document.querySelectorAll(".toggle-bookmark i").forEach(t=>{t.classList.toggle("fas"),t.classList.toggle("far")}):loginMdl()})})});