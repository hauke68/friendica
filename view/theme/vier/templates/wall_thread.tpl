
{{if $mode == display}}
{{else}}
{{if $item.comment_firstcollapsed}}
	<div class="hide-comments-outer">
		<span id="hide-comments-total-{{$item.id}}" 
			class="hide-comments-total">{{$item.num_comments}}</span>
			<span id="hide-comments-{{$item.id}}" 
				class="hide-comments fakelink" 
				onclick="showHideComments({{$item.id}});">{{$item.hide_text}}</span>
			{{if $item.thread_level==3}} - 
			<span id="hide-thread-{{$item}}-id"
				class="fakelink"
				onclick="showThread({{$item.id}});">expand</span> /
			<span id="hide-thread-{{$item}}-id"
				class="fakelink"
				onclick="hideThread({{$item.id}});">collapse</span> thread{{/if}}
	</div>
	<div id="collapsed-comments-{{$item.id}}" class="collapsed-comments" style="display: none;">
{{/if}}
{{/if}}

{{if $item.thread_level!=1}}<div class="children">{{/if}}

<div class="wall-item-decor">
	<img id="like-rotator-{{$item.id}}" class="like-rotator" src="images/rotator.gif" alt="{{$item.wait}}" title="{{$item.wait}}" style="display: none;" />
</div>

<div class="wall-item-container {{$item.indent}} {{$item.shiny}} {{$item.network}}" id="item-{{$item.guid}}">
	<div class="wall-item-item">
		<div class="wall-item-info">
			<div class="contact-photo-wrapper mframe{{if $item.owner_url}} wwfrom{{/if}}"
				onmouseover="if (typeof t{{$item.id}} != 'undefined') clearTimeout(t{{$item.id}}); openMenu('wall-item-photo-menu-button-{{$item.id}}')" 
				onmouseout="t{{$item.id}}=setTimeout('closeMenu(\'wall-item-photo-menu-button-{{$item.id}}\'); closeMenu(\'wall-item-photo-menu-{{$item.id}}\');',200)">
				<a href="{{$item.profile_url}}" target="redir" title="{{$item.linktitle}}" class="contact-photo-link" id="wall-item-photo-link-{{$item.id}}">
					<img src="{{$item.thumb}}" class="contact-photo {{$item.sparkle}}" id="wall-item-photo-{{$item.id}}" alt="{{$item.name}}" />
				</a>
				<a href="#" rel="#wall-item-photo-menu-{{$item.id}}" class="contact-photo-menu-button icon s16 menu" id="wall-item-photo-menu-button-{{$item.id}}">menu</a>
				<ul class="contact-menu menu-popup" id="wall-item-photo-menu-{{$item.id}}">
				{{$item.item_photo_menu}}
				</ul>
				
			</div>
			{{if $item.owner_url}}
			<div class="contact-photo-wrapper mframe wwto" id="wall-item-ownerphoto-wrapper-{{$item.id}}" >
				<a href="{{$item.owner_url}}" target="redir" title="{{$item.olinktitle}}" class="contact-photo-link" id="wall-item-ownerphoto-link-{{$item.id}}">
					<img src="{{$item.owner_photo}}" class="contact-photo {{$item.osparkle}}" id="wall-item-ownerphoto-{{$item.id}}" alt="{{$item.owner_name}}" />
				</a>
			</div>
			{{/if}}			
		</div>
		<div class="wall-item-actions-author">
			<a href="{{$item.profile_url}}" target="redir" title="{{$item.linktitle}}" class="wall-item-name-link"><span class="wall-item-name{{$item.sparkle}}">{{$item.name}}</span></a>
			{{if $item.owner_url}}{{$item.via}} <a href="{{$item.owner_url}}" target="redir" title="{{$item.olinktitle}}" class="wall-item-name-link"><span class="wall-item-name{{$item.osparkle}}" id="wall-item-ownername-{{$item.id}}">{{$item.owner_name}}</span></a> <!-- {{$item.vwall}} -->{{/if}}
			<span class="wall-item-ago">
				{{if $item.plink}}<a title="{{$item.plink.title}}" href="{{$item.plink.href}}" style="color: #999">{{$item.created}}</a>{{else}} {{$item.created}} {{/if}}
			</span>
			{{if $item.lock}}<span class="icon s10 lock fakelink" onclick="lockview(event,{{$item.id}});" title="{{$item.lock}}">{{$item.lock}}</span>{{/if}}
			<span class="wall-item-network" title="{{$item.app}}">
				{{$item.network_name}}
			</span>
		</div>

		<div itemprop="description" class="wall-item-content">
			{{if $item.title}}<h2><a href="{{$item.plink.href}}" class="{{$item.sparkle}}">{{$item.title}}</a></h2>{{/if}}
			{{$item.body}}
		</div>
	</div>
	<div class="wall-item-bottom">
		<div class="wall-item-links">
		</div>
		<div class="wall-item-tags">
			{{foreach $item.hashtags as $tag}}
				<span class='tag'>{{$tag}}</span>
			{{/foreach}}
  			{{foreach $item.mentions as $tag}}
				<span class='mention'>{{$tag}}</span>
			{{/foreach}}
               {{foreach $item.folders as $cat}}
                    <span class='folder'>{{$cat.name}}</a>{{if $cat.removeurl}} (<a href="{{$cat.removeurl}}" title="{{$remove}}">x</a>) {{/if}} </span>
               {{/foreach}}
                {{foreach $item.categories as $cat}}
                    <span class='category'>{{$cat.name}}</a>{{if $cat.removeurl}} (<a href="{{$cat.removeurl}}" title="{{$remove}}">x</a>) {{/if}} </span>
                {{/foreach}}
		</div>
	</div>	
	<div class="wall-item-bottom">
		<div class="wall-item-links">
			{{if $item.plink}}<a title="{{$item.plink.title}}" href="{{$item.plink.orig}}"><i class="icon-link icon-large"></i></a>{{/if}}
		</div>
		<div class="wall-item-actions">
			<div class="wall-item-actions-social">
			{{if $item.threaded}}
			{{/if}}
			{{if $item.comment}}
				<span id="comment-{{$item.id}}" class="fakelink togglecomment" onclick="openClose('item-comments-{{$item.id}}'); commentExpand({{$item.id}});" title="{{$item.switchcomment}}"><i class="icon-reply"></i></span>
			{{/if}}
			{{if $item.vote}}
				{{if $item.vote.like}}
				<a href="#" id="like-{{$item.id}}" title="{{$item.vote.like.0}}" onclick="dolike({{$item.id}},'like'); return false"><i class="icon-thumbs-up icon-large"></i></a>
				{{/if}}{{if $item.vote.dislike}}
				<a href="#" id="dislike-{{$item.id}}" title="{{$item.vote.dislike.0}}" onclick="dolike({{$item.id}},'dislike'); return false"><i class="icon-thumbs-down icon-large"></i></a>
				{{/if}}
			    {{if $item.vote.share}}
				    <a href="#" id="share-{{$item.id}}" title="{{$item.vote.share.0}}" onclick="jotShare({{$item.id}}); return false"><i class="icon-retweet icon-large"></i></a>
			    {{/if}}
			{{/if}}
			{{if $item.star}}
				<a href="#" id="star-{{$item.id}}" onclick="dostar({{$item.id}}); return false;"  class="{{$item.star.classdo}}"  title="{{$item.star.do}}"><i class="icon-star icon-large"></i></a>
				<a href="#" id="unstar-{{$item.id}}" onclick="dostar({{$item.id}}); return false;"  class="{{$item.star.classundo}}"  title="{{$item.star.undo}}"><i class="icon-star-empty icon-large"></i></a>
			{{/if}}
			{{if $item.ignore}}
				<a href="#" id="ignore-{{$item.id}}" onclick="doignore({{$item.id}}); return false;"  class="{{$item.ignore.classdo}}"  title="{{$item.ignore.do}}"><i class="icon-bell-slash icon-large"></i></a>
				<a href="#" id="unignore-{{$item.id}}" onclick="doignore({{$item.id}}); return false;"  class="{{$item.ignore.classundo}}"  title="{{$item.ignore.undo}}"><i class="icon-bell-slash-o icon-large"></i></a>
			{{/if}}
			{{if $item.tagger}}
				<a href="#" id="tagger-{{$item.id}}" onclick="itemTag({{$item.id}}); return false;" class="{{$item.tagger.class}}" title="{{$item.tagger.add}}"><i class="icon-tags icon-large"></i></a>
			{{/if}}
			{{if $item.filer}}
                                <a href="#" id="filer-{{$item.id}}" onclick="itemFiler({{$item.id}}); return false;" class="filer-item filer-icon" title="{{$item.filer}}"><i class="icon-folder-close icon-large"></i></a>
			{{/if}}
			</div>
			<div class="wall-item-location">{{$item.location}} {{$item.postopts}}</div>
			<div class="wall-item-actions-tools">

				{{if $item.drop.pagedrop}}
					<input type="checkbox" title="{{$item.drop.select}}" name="itemselected[]" class="item-select" value="{{$item.id}}" />
				{{/if}}
				{{if $item.drop.dropping}}
					<a href="item/drop/{{$item.id}}" onclick="return confirmDelete();" title="{{$item.drop.delete}}"><i class="icon-trash icon-large"></i></a>
				{{/if}}
				{{if $item.edpost}}
					<a href="{{$item.edpost.0}}" title="{{$item.edpost.1}}"><i class="icon-edit icon-large"></i></a>
				{{/if}}
			</div>
			
		</div>
	</div>
	<div class="wall-item-bottom">
		<div class="wall-item-links">
		</div>
		<div class="wall-item-like" id="wall-item-like-{{$item.id}}">{{$item.like}}</div>
		<div class="wall-item-dislike" id="wall-item-dislike-{{$item.id}}">{{$item.dislike}}</div>	
	</div>
	
	{{if $item.threaded}}{{if $item.comment}}
	<div class="wall-item-bottom">
		<div class="wall-item-links">
		</div>
		<div class="wall-item-comment-wrapper" id="item-comments-{{$item.id}}" style="display: none;">
					{{$item.comment}}
		</div>
	</div>
	{{/if}}{{/if}}
</div>


{{foreach $item.children as $child}}
	{{if $item.type == tag}}
		{{include file="wall_item_tag.tpl" item=$child}}
	{{else}}
		{{include file="{{$item.template}}" item=$child}}
	{{/if}}
{{/foreach}}

{{if $item.thread_level!=1}}</div>{{/if}}


{{if $mode == display}}
{{else}}
{{if $item.comment_lastcollapsed}}</div>{{/if}}
{{/if}}

{{if $item.total_comments_num}}
	{{if $item.threaded}}{{if $item.comment}}{{if $item.thread_level==1}}
		<div class="wall-item-comment-wrapper" id="item-comments-{{$item.id}}">{{$item.comment}}</div>
	{{/if}}{{/if}}{{/if}}

	{{if $item.flatten}}
		<div class="wall-item-comment-wrapper" id="item-comments-{{$item.id}}">{{$item.comment}}</div>
	{{/if}}
{{else}}
	{{if $item.threaded}}{{if $item.comment}}{{if $item.thread_level==1}}
		<div class="wall-item-comment-wrapper" id="item-comments-{{$item.id}}" style="display: none;">{{$item.comment}}</div>
	{{/if}}{{/if}}{{/if}}

	{{if $item.flatten}}
		<div class="wall-item-comment-wrapper" id="item-comments-{{$item.id}}" style="display: none;">{{$item.comment}}</div>
	{{/if}}
{{/if}}