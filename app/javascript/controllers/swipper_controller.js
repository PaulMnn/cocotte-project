import { Controller } from '@hotwired/stimulus';
import Swiper from 'swiper/swiper-bundle';

export default class extends Controller {
  connect() {
    this.swiper = new Swiper('.swiper-container', {
      // Swiper configuration options
      pagination: {
        el: ".swiper-pagination",
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  }
}
