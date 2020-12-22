document.addEventListener("DOMContentLoaded", function() {
  const favorite_btn = document.querySelector('.posts-show #favorite_btn')

  if (favorite_btn) {
    favorite_btn.addEventListener("click", function(e) {
      e.preventDefault()

      // 打 API / 送資料 / AJAX
      const ax = require('axios')
      const token = document.querySelector('[name=csrf-token]').content
      ax.defaults.headers.common['X-CSRF-TOKEN'] = token

      const postId = e.currentTarget.dataset.id
      const icon = e.target

      ax.post(`/posts/${postId}/favorite`, {})
        .then(function(resp){
          if (resp.data.status == "added") {
            icon.classList.remove("far")
            icon.classList.add("fas")
          } else {
            icon.classList.remove("fas")
            icon.classList.add("far")
          }
        })
        .catch(function(err) {
          console.log(err);
        })
    })
  }
})
