import Component from "@glimmer/component";

export default class AdobeFooter extends Component {
  <template>
    <div class="footer">
      <div class="wrap">
        <p class="copyright">
           Copyright © 2024 Adobe. All rights reserved.
        </p>

        <ul>
          <li>
            <a href="/t5/ct-using-the-community/ct-p/ct-Using-the-Community">
              Using the Community
            </a>
          </li>
          <li>
            <a href="https://experienceleague.adobe.com">
              Experience League
            </a>
          </li>
          <li>
            <a href="https://www.adobe.com/legal/terms.html">
              Terms of Use
            </a>
          </li>
          <li>
            <a href="https://www.adobe.com/privacy.html">
              Privacy
            </a>
          </li>
          <li>
            <a id="openCookieModal">
              Cookie preferences
            </a>
          </li>
          <li>
            <a href="https://www.adobe.com/privacy/us-rights.html">
              Do not sell or share my personal information
            </a>
          </li>
          <li>
            <a href="https://www.adobe.com/privacy/opt-out.html#interest-based-ads">
              <img loading="lazy" src="https://community.adobe.com/html/@6514E57C8658C21B6DE1FE2B796D8291/assets/adchoices.svg" alt="ad choices">AdChoices
            </a>
          </li>
        </ul>
      </div>
    </div>
  </template>
}
