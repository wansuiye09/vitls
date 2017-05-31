function instructions(job, h)
{
    h.append("<h1>重要的说明</h1>");
    h.append("<p>在此次任务中，你需要标注一个视频。你的任务是绘制一个框来标注视频中出现的每一个目标物体并在整个视频中追踪它们。这些说明会告诉你使用这个工具的技巧。</p>");

    h.append("<h2>速成课</h2>");
    var str = "<ul>";
    str += "<li>标注<strong>每一个</strong>目标物体。</li>";
    str += "<li>标注静止的目标物体、被遮挡的目标物体以及移动的目标物体。</li>";
    str += "<li>让你所绘制的框尽可能地贴紧目标物体。</li>";
    if (job.perobject > 0)
    {
        var amount = Math.floor(job.perobject * 100);
        str += "<li>我们将向您支付<strong>" + amount + "&cent;为您所标注的</strong>每一个目标物体</li>";
    }
    if (job.completion > 0)
    {
        var amount = Math.floor(job.completion * 100);
        str += "<li>我们将奖励您<strong>" + amount + "&cent; 如果你标注了所有目标物体</strong>。</li>";
    }
    if (job.skip > 0)
    {
        str += "<li>在视频暂停时，调整你所标注的内容。</li>";
    }
    str += "<li>我们会人工检查你的标注。</li>";
    str += "</ul>";
    h.append(str);

    h.append("<h2>入门指南</h2>");
    h.append("<img src='box.jpg' align='right'>");
    h.append("<p>点击<strong>新建标注对象</strong>按钮来开始标注你的第一个目标物体。将屏幕上的光标定位在即将标注的目标物体的一角，使十字准线对齐目标物体并点击，然后再点击另一个角落便绘制好了一个标注框。矩形框应该完全紧密地包围你正在标注的物体。如果有必要的话，可以通过拖动标注框的边缘来调整它。</p>");

    h.append("<img src='classify.jpg' align='right'>");
    h.append("<p>在新建标注对象按钮的正下方，你会发现一个彩色的方框。这个方框会要求你点选正在标注的目标物体的类型。</p>");

    if (job.skip > 0)
    {
        h.append("<p>按下<strong>播放</strong>按钮，视频便开始播放。当视频自动暂停时，调整标注框。用你的鼠标将标注框拖放至合适的位置，如有必要可调整标注框的大小。重复这个过程直到你标记完整个视频。</p>");
    }
    else
    {
        h.append("<p>按下<strong>播放</strong>按钮，视频便开始播放，当你正在追踪的目标物体移动了一些时，点击<strong>暂停</strong>按钮。用你的鼠标将标注框拖放至合适的位置，如有必要可调整标注框的大小。 重复这个过程直到你标记完整个视频。</p>");
    }

    if (job.perobject > 0)
    {
        h.append("<p>当你播放完整个视频时，你应该点击回到开头按钮（在播放按钮旁）来重新播放视频，重复上述过程来标注视频中的所有目标物体 。如果你能在每一个视频中标注大量的目标物体是再好不过的，我们会为你所标注的每一个目标物体奖励你。</p>");
    }
    else
    {
        h.append("<p>当你播放完整个视频时，你应该点击回到开头按钮（在播放按钮旁）来重新播放视频，重复上述过程来标注视频中的所有目标物体 。如果你能在每一个视频中标注大量的目标物体是再好不过的。</p>");
    }

    h.append("<img src='outsideoccluded.jpg' align='right'>");
    h.append("<p>如果一个目标物体不再出现在该场景中，请勾选对应该物体的<strong>超出当前帧</strong>复选框。请务必确保你点击了正确的按钮。当你的鼠标悬停在某一控制方框上时，相应的标注框就会在屏幕上高亮显示。同样的，如过你正在追踪的目标物体仍然在当前帧范围内，在它被遮挡的情况下(例如在车里)，请勾选<strong>物体被遮挡</strong>复选框。 当这些目标物体再次出现时，请记得去掉之前点击的复选框。 如果有描述额外属性的复选框，请在系统的要求下点选它们。比如将行走中的人标记为“行走中”。</p>");

    h.append("<p>如果屏幕上有很多目标物体，很难选中合适的标注框，通过点击锁定按钮<img src='lock.jpg'>（位于一个目标物体控制方框的右上角）可以防止在追踪过程中误操作。再次点击锁定按钮可以取消锁定。</p>");

    h.append("<p>标注框和物体之间的对应关系很容易被混淆，当你在屏幕上点击一个标注框时，会有提示框显示它的前后关键帧以方便你确认它的具体身份。</p>");
    
    h.append("<p>当你准备提交工作时，请再次重新播放并仔细检查视频。在整个标注过程中是否每一个标注框都框选了他所追踪的目标物体？如果你发现遗漏了某一个点，请点击<strong>暂停</strong>并调整标注框。全部检查完毕之后，请点击<strong>提交</strong>按钮。我们会尽快支付你的薪水。</p>");

    h.append("<h2>我们认可你的工作的标准</h2>");
    h.append("<p>我们将回顾你的工作并只接受其中高质量的部分，你的标注不会和其他工作者相比较。请遵循这些指导方针以确保你的工作被认可：</p>");

    h.append("<h3>标注每一个目标物体</h3>")
    h.append("<embed height='415' width='544' quality='high' allowfullscreen='true' type='application/x-shockwave-flash' src='//static.hdslb.com/miniloader.swf' flashvars='aid=10832470&page=1' pluginspage='//www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash'></embed>")

    if (job.perobject > 0)
    {
        h.append("<p>在整个视频中，每一个目标物体都应该被打上标签。以上工作会被认可，是因为每一个目标物体都有对应的标注框。任何一个目标物体的漏标不应该超过一次。即使目标物体没有移动，你也应该标注它。我们会为你所标记的每一个目标物体奖励你。</p>");
    }
    else
    {
        h.append("<p>在整个视频中，每一个目标物体都应该被打上标签。以上工作会被认可，是因为每一个目标物体都有对应的标注框。任何一个目标物体的漏标不应该超过一次。即使目标物体没有移动，你也应该标注它。</p>");
    }

    h.append("<h3>标注框紧致</h3>");
    h.append("<table><tr><td><img src='tight-good.jpg'></td><td><img src='tight-bad.jpg'></td></tr><tr><th>Good</th><th>Bad</th></tr></table>");
    h.append("<p>你所绘制的标注框必须是紧致的。它必须尽可能的贴合目标物体。右边宽大的标注框是不可接受的，而左边紧致的标注框可以被接受。</p>");

    h.append("<h3>标注整个视频</h3>")
    h.append("<img src='sequence1.jpg'>");
    h.append("<img src='sequence3.jpg'>");
    h.append("<img src='sequence4.jpg'><br>");
    h.append("<p>整个视频必须都被标注。当一个目标物体移动时，你需要更新它的位置。一个标注框只能标注一个目标物体。一个标注框必须一直对应它所追踪的物体。</p>");

    h.append("<h3>消失和再次出现的物体</h3>");
    h.append("<p>为了确保你的工作被接受，你应该在他们离开和进入屏幕时打上相应的标签。我们希望你标注上目标物体进入和离开屏幕的时间。通常很难找到他们进入和离开屏幕的确切时间，我们允许你的标注中存在轻微的误差。</p>");

    h.append("<img src='entering1.png'><img src='entering2.png'><img src='entering3.png'><img src='entering4.png'><br>");

    h.append("<p>如果一个目标物体进入另一个目标物体（比如一个人进入一辆车内），你应该在这帧之外标注出这个消失的目标物体。同样的, 当一个目标物体走出包围他的目标物体时，你也应该打上标注。</p>");

    h.append("<img src='outofcar1.png'><img src='outofcar2.png'><img src='outofcar3.png'><br>");

    h.append("<p>如果一个目标物体消失后又再次出现，你应该在当前帧标注出他的回归。切记<em>不要</em>在它重新出现时以一个新物体来标注它。只用在右侧的控制方框中找到相应的复选框，取消选中的<strong>超出当前帧</strong>复选框并将标注框移动到合适的位置。</p>");

    h.append("<h2>高级功能</h2>");
    h.append("<p>我们也为标注那些特别困难的视频提供了一些高级工具，点击<strong>选项</strong>按钮便可以使用这些高级工具。</p>");
    h.append("<ul>" +
        "<li>点击<strong>禁用尺寸调整</strong>将暂时禁止你调整标注框。当标注框特别小的时候这个选项会很有帮助。</li>" +
        "<li>点击<strong>隐藏标注框</strong>会暂时隐藏屏幕上的标注框。当屏幕变得很拥挤时这个选项会很有帮助。记得再次点击可以让标注框重新出现在屏幕上！</li>" +
        "<li>按钮<strong>很慢</strong>,<strong>慢</strong>,<strong>正常</strong>,<strong>快</strong>会改变视频的播放速度。如果视频内容很混乱，慢放视频会很有帮助。</li>" +
    "</ul>");

    h.append("<h3>快捷键</h3>");
    h.append("<p>为方便起见，提供如下快捷键使用：</p>");
    h.append('<ul class="keyboardshortcuts">' +
        '<li><code>n</code>创建一个新标注对象</li>' +
        '<li><code>t</code>暂停或播放视频</li>' +
        '<li><code>r</code>回到视频的最开始</li>' +
        '<li><code>h</code>隐藏或显示标注框（只有在点击选项按钮之后可用）</li>' +
        '<li><code>d</code>向前10帧</li>' +
        '<li><code>f</code>向后10帧</li>' +
        '<li><code>v</code>向前1帧</li>' +
        '<li><code>c</code>向后1帧</li>' +
        '</ul>');
}
