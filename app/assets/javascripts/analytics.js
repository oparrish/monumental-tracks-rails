$(document).ready(function() {
  $('div#read-and-listen > div > a').click(function(event){
    _gaq.push(['_trackEvent','outbound-read-and-listen',$(this).attr("href")];
  });
  
	$('p.episode_download_link > a').click(function(event){
    _gaq.push(['_trackEvent','outbound-episode-download',$(this).attr("href")];
    alert($(this).attr("href"));
  });
});