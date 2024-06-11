import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="previews"
export default class extends Controller {
  static targets = ["input", "preview"]
  connect() {
  }

  preview() {
    console.log (this.inputTarget);
    console.log(this.previewTarget)

    let input = this.inputTarget;
    let preview = this.previewTarget;
    let file = input.files[0];
    let reader = new FileReader ();

    reader.onloadend = () => {
      preview.src = reader.result;
    };

    if (input.files && input.files[0]) {
      let file = input.files[0];
      reader.readAsDataURL(file);
    } else {
      preview.src = "";
    }
  }

}
