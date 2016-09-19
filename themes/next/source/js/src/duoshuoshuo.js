 var OriginTitile = document.title;
  var titleTime;
  document.addEventListener('visibilitychange', function () {
      if (document.hidden) {
          $('[rel="icon"]').attr('href', "/img/TEP.ico");
          document.title = '(●—●) 你快回来~ | 量子广告！';
          clearTimeout(titleTime);
      }
      else {
          $('[rel="icon"]').attr('href', "/favicon.ico");
          document.title = '(/≧▽≦/)马上正常~' + OriginTitile;
          titleTime = setTimeout(function () {
              document.title = OriginTitile;
          }, 2000);
      }
  });