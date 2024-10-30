import Component from "@glimmer/component";
import { inject as service } from "@ember/service";
import { defaultHomepage } from "discourse/lib/utilities";
import didInsert from "@ember/render-modifiers/modifiers/did-insert";
import { ajax } from "discourse/lib/ajax";
import { popupAjaxError } from "discourse/lib/ajax-error";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import { number } from "discourse/lib/formatter";
import { eq } from "truth-helpers";
import { LinkTo } from "@ember/routing";

export default class CategoryCards extends Component {
  @service router;
  @service store;

  @tracked categories = [];
  @tracked loadingError = null;

  constructor() {
    super(...arguments);
    this.fetchCategories();
  }

  @action
  async fetchCategories() {
    this.categories = [];

    try {
      const response = await ajax("/categories");

      this.categories = response.category_list.categories
      console.log(this.categories)
    } catch (e) {
	  this.loadingError = e.message
    }
  }

  <template>
  	<div class="category-cards">
  		{{#if this.loadingError}}
  			<p>Could not load categories.</p>
  		{{else}}
  			{{#each this.categories as |category|}}
          <a
            href={{category.topic_url}}
            title={{category.name}}
            class="category-card"
          >
            <svg xmlns="http://www.w3.org/2000/svg" width="42" height="40.5" viewBox="0 0 42 40.5">
              <path data-name="Path 83241" d="M7.435,0H34.565A7.435,7.435,0,0,1,42,7.435V33.065A7.435,7.435,0,0,1,34.565,40.5H7.435A7.435,7.435,0,0,1,0,33.065V7.435A7.435,7.435,0,0,1,7.435,0Z" fill="#001e36"/>
              <path data-name="Path 83239" d="M11.636,31.7V13.97c0-.129.056-.194.167-.194q.443,0,1.054-.014l1.318-.028,1.5-.028q.791-.014,1.568-.014a10.428,10.428,0,0,1,3.552.527,6.166,6.166,0,0,1,2.317,1.415,5.43,5.43,0,0,1,1.263,1.956,6.5,6.5,0,0,1,.388,2.234,6.165,6.165,0,0,1-1.027,3.663,5.8,5.8,0,0,1-2.775,2.1,11.042,11.042,0,0,1-3.885.652q-.611,0-.86-.014t-.749-.014v5.467a.221.221,0,0,1-.25.25H11.83Q11.636,31.924,11.636,31.7Zm3.83-14.6v5.744q.36.028.666.028h.916a6.545,6.545,0,0,0,1.984-.277,2.993,2.993,0,0,0,1.416-.916,2.665,2.665,0,0,0,.541-1.776,2.805,2.805,0,0,0-.4-1.526,2.589,2.589,0,0,0-1.207-.985,5.142,5.142,0,0,0-2.026-.347q-.666,0-1.179.014t-.708.042Z" transform="translate(-11.636 -13.689)" fill="#31a8ff"/>
              <path data-name="Path 83240" d="M40.408,23.09a9.787,9.787,0,0,0-2-.583,8.764,8.764,0,0,0-1.928-.222,3.594,3.594,0,0,0-1.041.125.935.935,0,0,0-.541.347.874.874,0,0,0-.138.472.737.737,0,0,0,.166.444,1.89,1.89,0,0,0,.583.458,11.6,11.6,0,0,0,1.221.569,12.106,12.106,0,0,1,2.65,1.263,4.031,4.031,0,0,1,1.36,1.429,3.809,3.809,0,0,1,.4,1.776,3.986,3.986,0,0,1-.666,2.289A4.377,4.377,0,0,1,38.547,33a7.764,7.764,0,0,1-3.122.555,11.286,11.286,0,0,1-2.345-.222,8.6,8.6,0,0,1-1.874-.555.359.359,0,0,1-.194-.333v-3a.163.163,0,0,1,.07-.153.135.135,0,0,1,.152.014,8.1,8.1,0,0,0,2.248.846,8.806,8.806,0,0,0,2.026.264,3.113,3.113,0,0,0,1.429-.25.784.784,0,0,0,.458-.721.918.918,0,0,0-.416-.694,6.9,6.9,0,0,0-1.693-.8A10.2,10.2,0,0,1,32.831,26.7a4.229,4.229,0,0,1-1.3-1.457,3.822,3.822,0,0,1-.4-1.762,3.978,3.978,0,0,1,.583-2.081,4.235,4.235,0,0,1,1.8-1.582,5.721,5.721,0,0,1,2.808-.7,17.552,17.552,0,0,1,2.34.034,7.985,7.985,0,0,1,1.832.611.252.252,0,0,1,.166.153.765.765,0,0,1,.028.208v2.8a.187.187,0,0,1-.083.166.182.182,0,0,1-.194,0Z" transform="translate(-16.48 -15.039)" fill="#31a8ff"/>
            </svg>

  					<span class="details">
              <span class="name">{{category.name}}</span>
              <span class="counter">{{number category.post_count}} conversation{{#unless (eq category.post_count 1)}}s{{/unless}}</span>
            </span>
  				</a>
  			{{/each}}
  		{{/if}}
  	</div>
  </template>
}
