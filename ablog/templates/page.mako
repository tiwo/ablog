<%inherit file="layout.mako"/>
<% fa = ablog.fontawesome %>
<%block name="headers">
  ${parent.headers()}
  % if ablog.blog_baseurl:
  <link rel="alternate" type="application/atom+xml"  href="${ pathto(ablog.feed_path, 1) }/atom.xml" title="${ ablog.blog_title }">
  % endif
  % if ablog.fontawesome_link_cdn:
  <link href="${ablog.fontawesome_link_cdn}" rel="stylesheet">
  % elif ablog.fontawesome_css_file:
  <link rel="stylesheet" href="${ pathto('_static/' + ablog.fontawesome_css_file, 1) }" type="text/css" />
  % endif
  <style type="text/css">
    ul.ablog-archive {list-style: none; overflow: auto; margin-left: 0px}
    ul.ablog-archive li {float: left; margin-right: 5px; font-size: 80%}
    ul.post-list-style-disc {list-style-type: disc;}
    ul.post-list-style-none {list-style-type: none;}
    ul.post-list-style-circle {list-style-type: circle;}
  </style>
</%block>

${body}
<div class="section">
% if pagename in ablog:
    <%include file="postnavy.mako"/>
% endif
% if ablog.disqus_shortname and ablog.blog_baseurl and ((pagename in ablog and (ablog[pagename].published or ablog.disqus_drafts)) or (not pagename in ablog and ablog.disqus_pages)):
    <div class="section">
    <h2>Comments</h2>
    <div id="disqus_thread"></div>
    <script type="text/javascript">
        var disqus_shortname = '${ablog.disqus_shortname}';
        var disqus_identifier = '${ablog.page_id(pagename)}';
        var disqus_title = '${title}';
        var disqus_url = '${ablog.page_url(pagename)}';
        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
    </div>
% endif
  </div>
