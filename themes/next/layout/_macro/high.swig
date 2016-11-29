  <a title="收藏到书签，偶尔High一下^_^" rel="alternate" class="mw-harlem_shake_slow wobble shake" href='javascript:(
    /*
     * Copyright (C) 2015 Rocko (rocko.xyz) <rocko.zxp@gmail.com>
     *
     * Licensed under the Apache License, Version 2.0 (the "License");
     * you may not use this file except in compliance with the License.
     * You may obtain a copy of the License at
     *
     *      http://www.apache.org/licenses/LICENSE-2.0
     *
     * Unless required by applicable law or agreed to in writing, software
     * distributed under the License is distributed on an "AS IS" BASIS,
     * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
     * See the License for the specific language governing permissions and
     * limitations under the License.
     */

    function go() {


      var songs = [
          "http://7u2ss1.com1.z0.glb.clouddn.com/%E9%AB%98%E6%A2%A8%E5%BA%B7%E6%B2%BB%20-%20%E5%AD%A4%E7%8B%AC.mp3", 
          "http://7u2ss1.com1.z0.glb.clouddn.com/Enya%20-%20Only%20Time.mp3",
          "http://7u2ss1.com1.z0.glb.clouddn.com/Enya%20-%20May%20It%20Be.mp3",        
          "......"
      ];
 
      function S() {
          var e = document.getElementById("audio_element_id");
          if(e != null){
              var index = parseInt(e.getAttribute("curSongIndex"));
              if(index > songs.length - 2) {
                  index = 0;
              } else {
                  index++;
              }
              e.setAttribute("curSongIndex", index);
          }
          e.src = i;
          e.play()
      }
      function initAudioEle() {
          var e = document.getElementById("audio_element_id");
          if(e === null){
            e = document.createElement("audio");
            e.setAttribute("curSongIndex", 0);
            e.id = "audio_element_id";
            e.loop = false;
            e.bgcolor = 0;
            e.innerHTML = " <p>If you are reading this, it is because your browser does not support the audio element. We recommend that you get a new browser.</p> <p>";
            document.body.appendChild(e);
            e.addEventListener("ended", function() {
              go();
            }, true);
          }        
      }
    
      initAudioEle();
      var curSongIndex = parseInt(document.getElementById("audio_element_id").getAttribute("curSongIndex"));
      var i = songs[curSongIndex];
      S();
    })()'>
    <i class="fa fa-music"></i> 听音乐</a>