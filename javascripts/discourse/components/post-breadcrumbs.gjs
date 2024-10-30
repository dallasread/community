import Component from "@glimmer/component";
import { inject as service } from "@ember/service";
import { defaultHomepage } from "discourse/lib/utilities";
import didInsert from "@ember/render-modifiers/modifiers/did-insert";
import { ajax } from "discourse/lib/ajax";
import { popupAjaxError } from "discourse/lib/ajax-error";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import { number } from "discourse/lib/formatter";
import { LinkTo } from "@ember/routing";

export default class PostBreadcrumbs extends Component {
  @service router;
  @service store;

  @tracked routes;

  constructor() {
    super(...arguments);

    const routes = [{
      name: 'Home',
      url: '/'
    }]

    if (this.router.currentRoute.parent?.name === 'topic') {
      const category = this.router.currentRoute.parent.attributes?.category
      const post = this.router.currentRoute.parent.attributes

      if (category) {
        routes.push({
          name: category.name,
          url: category.url
        })
      }

      if (post) {
        routes.push({
          name: post.title,
          url: post.url
        })
      }
    }

    this.routes = routes
  }

  <template>
    <ul class="breadcrumbs">
      {{#each this.routes as |route|}}
        <li>
          <a href={{route.url}}>
            {{route.name}}
          </a>
        </li>
      {{/each}}
    </ul>
  </template>
}
