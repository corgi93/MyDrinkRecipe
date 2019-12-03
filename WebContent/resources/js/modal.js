		// modal창
		
		// 프로필 수정 btn click
		const modify_btn = document.querySelector(".modify_profile");
		
		// 카메라 img click
		const upload_btn = document.querySelector(".upload_thumbnail");
		
		const modal = document.querySelector(".modal");
		const modal2 = document.querySelector(".modal2");
		
		const overlay = modal.querySelector(".modal_overlay");
		const closeBtn = modal.querySelector(".closebtn");
		
		const overlay2 = modal2.querySelector(".modal_overlay2");
		const closeBtn2 = modal2.querySelector(".closebtn2");
		
        const openModal = () => {
            modal.classList.remove("hidden");
        }
        const closeModal = () => {
            modal.classList.add("hidden");
        }
        
        const openModal2 = () => {
            modal2.classList.remove("hidden");
        }
        const closeModal2 = () => {
            modal2.classList.add("hidden");
        }
		
        overlay.addEventListener("click", closeModal);
        closeBtn.addEventListener("click", closeModal);
        modify_btn.addEventListener("click", openModal);
        
        overlay2.addEventListener("click", closeModal2);
        closeBtn2.addEventListener("click", closeModal2);
        upload_btn.addEventListener("click", openModal2);
        
        // upload카메라 click -> modal
