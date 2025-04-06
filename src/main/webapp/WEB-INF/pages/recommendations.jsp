<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" class="">
   <head>
      <meta charset="UTF-8">
      <link href="https://fonts.googleapis.com/css?family=DM+Sans&amp;display=swap" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
      <script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>

      <style class="INLINE_PEN_STYLESHEET_ID">
         :root {
         --background: #ffffff;
         --cs-primary: #25b9f4;
         --cs-surface: #ffffff;
         --cs-surface-2: #eef4f8;
         --cs-separator: #e8ecf0;
         --cs-on-surface-primary: #000000;
         --cs-on-surface-secondary: #657786;
         --font-family-primary: "DM Sans", Aria, sans-serif;
         --joke-author-img-width: 60px;
         --joke-width: 480px;
         --layout-container-width: 920px;
         }
         * {
         box-sizing: border-box;
         }
         html,
         body {
         background: var(--background);
         font-family: var(--font-family-primary);
         font-size: 14px;
         line-height: 1.42;
         height: 100%;
         }
         #root {
         height: 100%;
         }
         .joke {
         background-color: var(--cs-surface);
         padding: 15px;
         min-height: calc(33px + var(--joke-author-img-width));
         transition: background-color 0.25s;
         }
         .joke:focus,
         .joke:hover {
         background-color: var(--cs-surface-2);
         }
         .joke_wrapper {
         margin-left: calc(1.25 * var(--joke-author-img-width));
         }
         .joke_block {
         position: relative;
         }
         .joke_block--header .joke_element {
         display: inline-block;
         margin-right: 7px;
         }
         .joke_element--author-img {
         height: var(--joke-author-img-width);
         left: calc(-1.25 * var(--joke-author-img-width));
         position: absolute;
         top: 3px;
         width: var(--joke-author-img-width);
         }
         .joke_element--author-img img {
         border-radius: 50%;
         max-width: 100%;
         }
         .joke_element--author-name {
         color: var(--cs-on-surface-primary);
         font-weight: bold;
         }
         .joke_element--author-username {
         color: var(--cs-on-surface-secondary);
         }
         .joke_element {
         margin: 0;
         }
         .joke_block--text {
         font-size: 18px;
         margin-top: 7px;
         }
         .joke_block--footer {
         margin-top: 12px;
         }
         .layout {
         height: 100%;
         }
         .layout_wrapper {
         display: grid;
         grid-template-columns: 140px 480px 1fr;
         height: 100%;
         margin: auto;
         width: var(--layout-container-width);
         }
         .layout_header {
         background-color: var(--cs-surface);
         height: 100%;
         }
         .layout_content {
         border-left: 1px solid var(--cs-separator);
         border-right: 1px solid var(--cs-separator);
         width: var(--joke-width);
         }
         .layout_footer {
         padding: 20px;
         }
         .feed_header {
         border-bottom: 1px solid var(--cs-separator);
         padding: 20px;
         }
         .feed {
         margin-bottom: 60px;
         }
         .feed_title {
         font-size: 20px;
         font-weight: bolder;
         margin: 0;
         }
         .feed_subtitle {
         color: var(--cs-on-surface-secondary);
         margin: 0;
         margin-top: 7px;
         }
         .feed_item {
         border-bottom: 1px solid var(--cs-separator);
         }
         .feed_error {
         padding: 40px;
         text-align: center;
         }
         .feed_error_icon {
         fill: hsla(197, 20%, 92%, 1);
         height: 90px;
         width: 90px;
         }
         .feed_error_title {
         color: var(--cs-on-surface-primary);
         font-weight: bold;
         margin: 0;
         margin-top: 1.3em;
         }
         .feed_error_text {
         color: var(--cs-on-surface-secondary);
         margin: 0;
         margin-top: 0.7em;
         }
         .navbar--header {
         background-color: #ffffff;
         /*box-shadow: 0 5px 30px hsla(197 , 75%, 55%, .08);*/
         position: relative;
         }
         .navbar_block {
         padding: 8px;
         }
         .navbar_header {
         display: flex;
         justify-content: flex-end;
         }
         .navbar_brand {
         display: block;
         padding: 20px 20px;
         }
         .navbar_brand svg {
         display: block;
         fill: var(--cs-primary);
         height: 34px;
         width: 34px;
         }
         .form--search-form input {
         -webkit-appearance: none;
         background-color: #e8ecf0;
         border: 2px solid #e8ecf0;
         border-radius: 25px;
         font-size: 12px;
         line-height: 1;
         outline: none;
         padding: 8px 12px;
         width: 100%;
         }
         .form--search-form input::placeholder {
         font-style: italic;
         }
         .form--search-form input:focus {
         border: 2px solid var(--cs-primary);
         }
         .nav {
         list-style: none;
         margin: 0;
         padding: 0;
         }
         .nav--joke_rebound .nav_item {
         display: inline-block;
         margin-right: 70px;
         }
         .nav--joke_rebound .nav_link svg {
         display: block;
         fill: var(--cs-on-surface-secondary);
         height: 20px;
         margin-right: 5px;
         width: 20px;
         }
         .nav--joke_rebound .nav_link {
         align-items: center;
         color: var(--cs-on-surface-secondary);
         display: flex;
         text-decoration: none;
         }
         .nav--joke_rebound .nav_link:hover {
         color: var(--cs-primary);
         }
         .nav--joke_rebound .nav_link:hover svg {
         fill: var(--cs-primary);
         }
         .pagination--infinite-scroll .pagination_button_next {
         background-color: #ffffff;
         border-color: transparent;
         color: var(--cs-primary);
         cursor: pointer;
         letter-spacing: 0.045em;
         padding: 20px;
         width: 100%;
         }
         .section {
         background-color: var(--cs-surface-2);
         border-radius: 10px;
         margin-bottom: 20px;
         }
         .section--search {
         background-color: #ffffff;
         }
         .section_block {
         padding: 15px;
         }
         .section_block--header {
         border-bottom: 1px solid var(--cs-separator);
         }
         .section_block--content p {
         margin: 0;
         margin-bottom: 1em;
         }
         .section_title {
         margin: 0;
         }
         .nav_item + .nav_item {
         margin-top: 10px;
         }
         .nav_link {
         color: var(--cs-on-surface-primary);
         text-decoration: none;
         }
         .nav_link_text--primary {
         color: var(--cs-on-surface-primary);
         display: block;
         font-weight: bold;
         font-size: 16px;
         }
         .nav_link_text--secondary {
         color: var(--cs-on-surface-secondary);
         }

         textarea {
             border: 0;
             border-radius: 0.5em;
             box-shadow: 0 0 0 0.1em #a8ceee inset;
             margin: 0 auto 0.75em auto;
             padding: 0.75em;
             resize: none;
             width: 100%;
             height: 5em;
         }
         .bottom {
             display: flex;
             justify-content: flex-end;
             align-items: center;
         }
         .bottom > span {
             margin-right: 0.75em;
         }
         button {
             background-color: #55abee;
             border: 0;
             color: #fff;
             display: inline-block;
             font-weight: bold;
         }
         button span {
             display: block;
             padding: 0.75em 1.5em;
             transition: all 0.1s linear;
         }
         button, button span {
             border-radius: 1.5em;
         }
      </style>
   </head>
   <body>


      <div id="root">
         <div>
            <div class="layout">
               <div class="layout_wrapper">
                  <div class="layout_header">
                     <div class="navbar navbar--header">
                        <div class="navbar_container">
                           <div class="navbar_header">
                              <a class="navbar_brand" href="#/">
                                 <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M24 13.313c0-2.053-.754-3.026-1.417-3.489.391-1.524 1.03-5.146-.963-7.409-.938-1.065-2.464-1.54-4.12-1.274-1.301-.557-3.266-1.141-5.5-1.141s-4.199.584-5.5 1.141c-1.656-.266-3.182.208-4.12 1.274-1.993 2.263-1.353 5.885-.963 7.409-.663.463-1.417 1.435-1.417 3.489 0 .996.326 2.131.986 3.102-.485 1.421.523 3.049 2.283 2.854-.318 1.622 1.365 2.928 3.082 2.128-.201 1.163 1.421 2.58 3.443 1.569.671.572 1.188 1.034 2.204 1.034 1.155 0 1.846-.643 2.277-1.035 2.022 1.012 3.574-.406 3.374-1.569 1.718.8 3.4-.506 3.082-2.128 1.76.195 2.768-1.433 2.283-2.854.659-.97.986-2.106.986-3.101zm-12 6.57c-1.722 0-2.4-1.883-2.4-1.883h4.8s-.612 1.883-2.4 1.883zm3.578-2.992c-1.052-.515-2.455-1.126-3.578-.322-1.124-.804-2.526-.193-3.578.322-4.251 2.08-8.024-4.023-5.842-5.444.204-.132.488-.135.672-.053.661.292 1.406-.191 1.406-.914 0-2.214.692-4.434 2.154-5.988l.015-.01c2.604-2.596 7.741-2.596 10.345 0l.016.011c1.462 1.554 2.154 3.774 2.154 5.987 0 .726.748 1.205 1.406.914.141-.063.436-.1.671.053 2.15 1.392-1.514 7.561-5.841 5.444zm.172-7.391c-1.124 0-2.094.629-2.607 1.546-.373-.116-.744-.174-1.143-.174s-.77.058-1.143.174c-.513-.917-1.483-1.546-2.607-1.546-1.654 0-3 1.346-3 3s1.346 3 3 3c1.231 0 2.285-.748 2.747-1.811.246-.566.394-1.301 1.003-1.301s.758.735 1.003 1.301c.462 1.063 1.516 1.811 2.747 1.811 1.654 0 3-1.346 3-3s-1.346-3-3-3zm-7.5 4.5c-.828 0-1.5-.672-1.5-1.5s.672-1.5 1.5-1.5 1.5.672 1.5 1.5-.672 1.5-1.5 1.5zm7.5 0c-.828 0-1.5-.672-1.5-1.5s.672-1.5 1.5-1.5 1.5.672 1.5 1.5-.672 1.5-1.5 1.5z"></path>
                                 </svg>
                              </a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="layout_content" element-id="70">
                                       <div class="feed" element-id="69">
                                          <div class="feed_header" element-id="68">
                                             <h1 class="feed_title" element-id="67">Recommendations for you :)</h1>
                                          </div>

                                        <c:forEach var = "member" items="${RECOMMENDATIONS}">
                                        <div class="feed_item" element-id="59">
                                         <div class="joke" element-id="58">
                                            <div class="joke_wrapper" element-id="57">
                                               <div class="joke_block joke_block--header" element-id="56">
                                                  <span class="joke_element joke_element--author-name" element-id="55">${member.name}</span><span class="joke_element joke_element--author-username" element-id="54">${member.email}</span>
                                                  <div class="joke_element joke_element--author-img" element-id="53"><img src="/static/images/default-user.png" element-id="52"></div>
                                               <button id="create-tweet" type="submit" tabindex="0" element-id="61">
                                            <span tabindex="-1" element-id="60">Follow</span>0
                                            </button></div>


                                            </div>
                                         </div>
                                      </div>


                                         </c:forEach>

                                          <div class="feed_item" element-id="66">


                                          </div>




                                          <div class="feed_footer" element-id="40">
                                             <div class="pagination pagination--infinite-scroll" element-id="39"><button class="pagination_button_next" element-id="38">Load more...</button></div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="layout_footer" element-id="37">
                                       <div class="section section--search" element-id="36">
                                          <form class="form form--search-form" element-id="35"><input placeholder="Search dad jokes..." element-id="34"></form>
                                       </div>
                                       <div class="section" element-id="33">
                                          <div class="section_block section_block--header" element-id="32">
                                             <h3 class="section_title" element-id="31">Trending now!</h3>
                                          </div>
                                          <div class="section_block section_block--content" element-id="30">
                                             <ul class="nav" element-id="29">
                                                <li class="nav_item" element-id="28"><a class="nav_link" href="#/search/Dad/1" element-id="27"><span class="nav_link_text nav_link_text--primary" element-id="26">#Dad</span><span class="nav_link_text nav_link_text--secondary" element-id="25">Jokes</span></a></li>
                                                <li class="nav_item" element-id="24"><a class="nav_link" href="#/search/Walk/1" element-id="23"><span class="nav_link_text nav_link_text--primary" element-id="22">#Walk</span><span class="nav_link_text nav_link_text--secondary" element-id="21">Jokes</span></a></li>
                                                <li class="nav_item" element-id="20"><a class="nav_link" href="#/search/What/1" element-id="19"><span class="nav_link_text nav_link_text--primary" element-id="18">#What</span><span class="nav_link_text nav_link_text--secondary" element-id="17">Jokes</span></a></li>
                                             </ul>
                                          </div>
                                       </div>
                                       <div class="section" element-id="16">
                                          <div class="section_block section_block--header" element-id="15">
                                             <h3 class="section_title" element-id="14">What's this?</h3>
                                          </div>
                                          <div class="section_block section_block--content" element-id="13">
                                             <p element-id="12">What if Twitter consisted only of dad jokes? Well that's the idea behind this pen.</p>
                                             <p element-id="11">Also, it was the occasion to redesign Twitter based on the july 2019 #newtwitter teasing, all done from tiny screenshots.</p>
                                             <p element-id="10">The jokes are fetched from icanhazdad.com API, users are added locally, everything else is Preact or react-router v5: feed, pagination, search, routing, etc.</p>
                                             <p element-id="9">There's a LOT of movies/video games references here. Can you spot them all?</p>
                                          </div>
                                       </div>
                                       <div class="section" element-id="8">
                                          <div class="section_block section_block--content" element-id="7">/</div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>

      <script type="text/javascript">
      $("#create-tweet").click(
      function(){
          $.ajax({
            type: "POST",
            url: "/user/create-post",
            data: JSON.stringify({ message: document.getElementById("tweet-message").value }),
            success: function(response){
                if(!!response){
                   alert(response);
                }
            },
            contentType: 'application/json'
          });

        });
      </script>
   </body>
</html>
