import{newTokenData,URL,isJson,addFormErrors,removeFormErrors,constructFormNameObj}from"./script.js";const passwordInput=document.querySelector("#pwd-input"),section1=document.querySelector("#section_1"),section2=document.querySelector("#section_2"),next1Btn=document.querySelector("#next_1"),backBtn=document.querySelector("#back_1"),completeBtn=document.querySelector("#complete_btn"),passwordToggle=document.querySelector("#pwd-toggle");passwordToggle.addEventListener("click",function(){"password"==passwordInput.getAttribute("type")?(passwordInput.setAttribute("type","text"),passwordToggle.querySelector("i").className="fas fa-eye-slash"):(passwordInput.setAttribute("type","password"),passwordToggle.querySelector("i").className="fas fa-eye")}),next1Btn.addEventListener("click",function(){const e=constructFormNameObj(["email","password","confirm_password","gender"]),t=newTokenData(e);fetch(`${URL}/ajax/user/sign-up-check-1`,{method:"POST",body:t}).then(e=>e.text()).then(e=>{if(isJson(e)){let t=JSON.parse(e);200===t.status?(removeFormErrors(t),section1.style.display="none",section2.style.display="block"):addFormErrors(t)}})}),completeBtn.addEventListener("click",function(){const e=constructFormNameObj(["email","gender","password","confirm_password","display_name","username","about"]);e.profile_img=document.querySelector("[name='profile_img']").files[0];const t=newTokenData(e);completeBtn.style.opacity="0.6",completeBtn.querySelector("span").innerHTML='Complete <i class="fas fa-circle-notch fa-spin"></i>',completeBtn.disabled=!0,fetch(`${URL}/ajax/user/complete-sign-up`,{method:"POST",body:t}).then(e=>e.text()).then(e=>{if(completeBtn.disabled=!1,completeBtn.style.opacity="1",completeBtn.querySelector("span").innerHTML="Complete",isJson(e)){let t=JSON.parse(e);200===t.status?(removeFormErrors(t),location.replace(`${URL}/user/login`)):addFormErrors(t)}})}),backBtn.addEventListener("click",function(){section2.style.display="none",section1.style.display="block"});