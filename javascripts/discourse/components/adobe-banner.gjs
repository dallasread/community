import Component from "@glimmer/component";
import { inject as service } from "@ember/service";
import { defaultHomepage } from "discourse/lib/utilities";
import didInsert from "@ember/render-modifiers/modifiers/did-insert";
import { ajax } from "discourse/lib/ajax";
import { popupAjaxError } from "discourse/lib/ajax-error";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import { number } from "discourse/lib/formatter";

export default class AdobeBanner extends Component {
  @service router;

  @tracked stats = null;

  constructor() {
    super(...arguments);
    this.fetchStats();
  }

  @action
  async fetchStats() {
    this.stats = null;

    try {
      const response = await ajax("/about");
      this.stats = {
        users_count: response.about.stats.users_count,
        posts_count: response.about.stats.posts_count,
        active_users_last_day: response.about.stats.active_users_last_day
      }
    } catch (e) {}
  }

  <template>
    <div class="block search-banner">
      <form action="/search">
        <h1>Connect and get inspired.</h1>
        <div class="search-wrapper">
          <svg class="search-icon"  xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
            <g >
              <rect data-name="S2_Icon_Search_20_N" width="20" height="20" fill="none" opacity="0.2"/>
            </g>
            <g >
              <path  data-name="Path 1027685" d="M18.78,17.72,13.7,12.636A7.016,7.016,0,1,0,12.637,13.7L17.72,18.78A.75.75,0,0,0,18.78,17.72ZM8.25,13.75a5.5,5.5,0,1,1,5.5-5.5A5.507,5.507,0,0,1,8.25,13.75Z" fill="#222"/>
            </g>
          </svg>
          <input type="text" class="search-input" name="q" value="" placeholder="Search Adobe Community...">
        </div>
      </form>

      {{#if this.stats}}
        <div class="stats">
          <div>
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
              <g  data-name="Group 605313" transform="translate(-146 -949)">
                <g  transform="translate(146 949)">
                  <rect  width="18" height="18" transform="translate(18 18) rotate(180)" fill="none" opacity="0.2"/>
                </g>
                <g  transform="translate(146 950)">
                  <path  data-name="Path 1027626" d="M12.1,11.659A4.154,4.154,0,0,1,8.026,7.434,4.154,4.154,0,0,1,12.1,3.21a4.154,4.154,0,0,1,4.071,4.224A4.154,4.154,0,0,1,12.1,11.659Zm0-6.988A2.685,2.685,0,0,0,9.505,7.434,2.685,2.685,0,0,0,12.1,10.2a2.685,2.685,0,0,0,2.591-2.764A2.685,2.685,0,0,0,12.1,4.671Zm-5.3,12.5c.213-1.94,2.542-3.459,5.3-3.459,2.785,0,5.113,1.515,5.3,3.45a.74.74,0,0,0,1.473-.14c-.261-2.675-3.236-4.771-6.775-4.771-3.564,0-6.476,2.047-6.774,4.762a.732.732,0,0,0,.656.8.767.767,0,0,0,.08,0,.736.736,0,0,0,.734-.652Zm.237-7.685a.727.727,0,0,0-.371-.965,2.766,2.766,0,0,1-1.6-2.553A2.685,2.685,0,0,1,7.653,3.2a2.449,2.449,0,0,1,.441.039.741.741,0,0,0,.862-.585.731.731,0,0,0-.592-.851,3.931,3.931,0,0,0-.71-.064A4.154,4.154,0,0,0,3.582,5.969,4.227,4.227,0,0,0,6.053,9.854a.745.745,0,0,0,.978-.367ZM2.35,15.707c.2-1.852,2.337-3.336,4.964-3.452a.733.733,0,0,0,.706-.762.723.723,0,0,0-.772-.7c-3.4.15-6.083,2.149-6.369,4.753a.732.732,0,0,0,.656.8.767.767,0,0,0,.08,0,.736.736,0,0,0,.734-.652Z" transform="translate(-0.875 -1.745)" fill="#fff"/>
                </g>
              </g>
            </svg>
            <span>{{number this.stats.users_count}} members</span>
          </div>
          <div>
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
              <g  data-name="Group 605801" transform="translate(-15008 -5807)">
                <rect  width="18" height="18" transform="translate(15008 5807)" fill="none" opacity="0.2"/>
                <g  data-name="Group 608204" transform="translate(0.234 -0.531)">
                  <path  data-name="Path 1027433" d="M6.327,17.8a.688.688,0,0,1-.27-.055.7.7,0,0,1-.421-.642V14.085H4.455A3.475,3.475,0,0,1,1,10.6V5.486A3.475,3.475,0,0,1,4.455,2h9.674a3.475,3.475,0,0,1,3.455,3.486V10.6a3.475,3.475,0,0,1-3.455,3.486h-3.7L6.806,17.608a.685.685,0,0,1-.479.2ZM4.455,3.394A2.085,2.085,0,0,0,2.382,5.486V10.6A2.085,2.085,0,0,0,4.455,12.69H6.327a.694.694,0,0,1,.691.7v2.08l2.658-2.582a.687.687,0,0,1,.479-.2h3.975A2.085,2.085,0,0,0,16.2,10.6V5.486a2.085,2.085,0,0,0-2.073-2.092Z" transform="translate(15007.766 5806.532)" fill="#fff"/>
                  <path  data-name="Path 1027434" d="M10.884,10.172h-4.3A.586.586,0,1,1,6.586,9h4.3a.586.586,0,0,1,0,1.172Z" transform="translate(15007.806 5806.265)" fill="#fff"/>
                  <path  data-name="Path 1027435" d="M11.665,7.172H6.586A.586.586,0,1,1,6.586,6h5.079a.586.586,0,0,1,0,1.172Z" transform="translate(15007.877 5806.588)" fill="#fff"/>
                  <path  data-name="Path 1027437" d="M10.884,10.172h-4.3A.586.586,0,1,1,6.586,9h4.3a.586.586,0,0,1,0,1.172Z" transform="translate(15007.806 5806.265)" fill="#fff"/>
                  <path  data-name="Path 1027438" d="M11.665,7.172H6.586A.586.586,0,1,1,6.586,6h5.079a.586.586,0,0,1,0,1.172Z" transform="translate(15007.877 5806.588)" fill="#fff"/>
                </g>
              </g>
            </svg>
            <span>{{number this.stats.posts_count}} conversations</span>
          </div>
          <div>
            <svg version="1.1"  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
               viewBox="0 0 20 20" style="width: 20px" xml:space="preserve">
              <g >
                <path fill="#fff" d="M17.2,18c-0.4,0-0.8-0.3-0.8-0.8c0-7.6-6.2-13.8-13.8-13.8C2.3,3.5,2,3.2,2,2.8S2.3,2,2.8,2
                  C11.2,2,18,8.8,18,17.2C18,17.7,17.7,18,17.2,18z"/>
                <path fill="#fff" d="M13,18c-0.4,0-0.8-0.3-0.8-0.8c0-5.2-4.2-9.5-9.5-9.5C2.3,7.8,2,7.4,2,7s0.3-0.8,0.8-0.8c6,0,11,4.9,11,11
                  C13.7,17.7,13.4,18,13,18z"/>
                <path fill="#fff" d="M5.2,17.8c-1.7,0-3-1.4-3-3s1.3-3,3-3s3,1.4,3,3S6.9,17.8,5.2,17.8z M5.2,13.3c-0.8,0-1.5,0.7-1.5,1.5
                  s0.7,1.5,1.5,1.5s1.5-0.7,1.5-1.5S6.1,13.3,5.2,13.3z"/>
              </g>
            </svg>
            <span>{{number this.stats.active_users_last_day}} users online</span>
          </div>
        </div>
      {{/if}}
    </div>
  </template>
}
