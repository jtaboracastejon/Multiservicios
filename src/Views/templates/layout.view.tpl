<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{SITE_TITLE}}</title>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" href="/{{BASE_DIR}}/dist/output.css" />
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://kit.fontawesome.com/{{FONT_AWESOME_KIT}}.js" crossorigin="anonymous"></script>
  
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  {{foreach SiteLinks}}
  <link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}" />
  {{endfor SiteLinks}}
  {{foreach BeginScripts}}
  <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor BeginScripts}}
</head>

<body>
  <header>

    {{include common/navbar}}

  </header>
  <main>
    {{{page_content}}}
  </main>
  <footer class="mt-10">
    {{include common/footer}}
  </footer>
  {{foreach EndScripts}}
  <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor EndScripts}}
  <script>
    document.addEventListener('DOMContentLoaded', function () {
      const burger = document.querySelectorAll('.navbar-burger');
      const menu = document.querySelectorAll('.navbar-menu');

      if (burger.length && menu.length) {
        for (var i = 0; i < burger.length; i++) {
          burger[i].addEventListener('click', function () {
            for (var j = 0; j < menu.length; j++) {
              menu[j].classList.toggle('hidden');
            }
          });
        }
      }

      const close = document.querySelectorAll('.navbar-close');
      const backdrop = document.querySelectorAll('.navbar-backdrop');

      if (close.length) {
        for (var i = 0; i < close.length; i++) {
          close[i].addEventListener('click', function () {
            for (var j = 0; j < menu.length; j++) {
              menu[j].classList.toggle('hidden');
            }
          });
        }
      }

      if (backdrop.length) {
        for (var i = 0; i < backdrop.length; i++) {
          backdrop[i].addEventListener('click', function () {
            for (var j = 0; j < menu.length; j++) {
              menu[j].classList.toggle('hidden');
            }
          });
        }
      }
    });
  </script>
</body>

</html>