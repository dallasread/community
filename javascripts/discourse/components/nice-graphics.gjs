import Component from "@glimmer/component";
import { inject as service } from "@ember/service";
import { defaultHomepage } from "discourse/lib/utilities";

export default class NiceGraphics extends Component {
	@service router;

  get isHomepage() {
    const { currentRouteName } = this.router;
    return currentRouteName === `discovery.${defaultHomepage()}`;
  }

  <template>
  	{{#if this.isHomepage}}
	  	<div class="nice-graphics">
	  		<h3>{{@data.title}}</h3>

				<div class="nice-graphics-list">
					{{#each @data.graphics as |graphic|}}
		        <a
		          href={{graphic.url}}
		          title={{graphic.title}}
		          class="nice-graphic"
		          style="background-image: url({{graphic.background_image}}); background-color: {{graphic.background_color}}; color: {{graphic.text_color}}"
		        >
		        	<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 23 23">
		        	  <g>
		        	    <rect width="23" height="23" fill="none" opacity="0.2"/>
		        	  </g>
		        	  <g transform="translate(2 1)">
		        	    <path d="M22,1.882V6.874a.882.882,0,1,1-1.765,0V4.012l-7.611,7.611a.882.882,0,0,1-1.248-1.248l7.611-7.611H16.126a.882.882,0,0,1,0-1.765h4.991A.883.883,0,0,1,22,1.882ZM20.824,18.353V13.977a.882.882,0,0,0-1.765,0v4.376a.883.883,0,0,1-.882.882H4.647a.883.883,0,0,1-.882-.882V4.824a.883.883,0,0,1,.882-.882H9.131a.882.882,0,0,0,0-1.765H4.647A2.65,2.65,0,0,0,2,4.824V18.353A2.65,2.65,0,0,0,4.647,21H18.176A2.65,2.65,0,0,0,20.824,18.353Z" transform="translate(-2 -1)" fill={{graphic.text_color}} />
		        	  </g>
		        	</svg>

		          <h4 class="title">{{graphic.title}}</h4>
		          <span class="description">{{graphic.description}}</span>
						</a>
					{{/each}}
				</div>
	  	</div>
	  {{/if}}
  </template>
}
