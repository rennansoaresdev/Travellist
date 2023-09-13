import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task"
export default class extends Controller {
  static targets = ["checkbox", "label"]

  connect() {
    console.log('Tasks controller connected')
  }
  toggleDone() {
    // console.log('Toggle done is listening...')
    const url = `/tasks/${this.checkboxTarget.dataset.id}`

    // Criar o form pra submeter os dados e fazer a chamada AJAX
    let form = new FormData()
    form.append("task[done]", this.checkboxTarget.checked)

    // Chama a action de update de tasks controller
    fetch(url, {
      method: "PATCH",
      credentials: "include",
      dataType: "script",
      headers: {
              "X-CSRF-Token": this.#getMetaValue("csrf-token")
      },
      body: form
    })
      .then(response => {
        if (this.checkboxTarget.checked) {
          this.labelTarget.innerHTML = `<s>${this.labelTarget.innerText}</s>`
        } else {
          this.labelTarget.innerHTML = this.labelTarget.innerText
        }
      })
  }

  #getMetaValue(param) {
    return document.getElementsByName(param)[0].content;
  }
}
