function instructions(job, h)
{
    h.append("<h1>重要的说明</h1>");
    h.append("<p>在此次任务中，你需要标注一个视频。你的任务是画一个盒子来包围视频中出现的每一个目标并在整个视频中追踪标注这些目标。这些说明会告诉你使用这个工具的小技巧。</p>");

    h.append("<h2>速成课</h2>");
    var str = "<ul>";
    str += "<li>标注<strong>每一个</strong>目标。</li>";
    str += "<li>标注静止目标、被遮挡目标以及移动的目标</li>";
    str += "<li>让你所画的盒子尽可能的贴紧目标</li>";
    if (job.perobject > 0)
    {
        var amount = Math.floor(job.perobject * 100);
        str += "<li>我们将向您支付<strong>" + amount + "&cent;为您所标注的</strong> 每一个目标</li>";
    }
    if (job.completion > 0)
    {
        var amount = Math.floor(job.completion * 100);
        str += "<li>我们将奖励您<strong>" + amount + "&cent; 如果你标注了所有目标</strong>.</li>";
    }
    if (job.skip > 0)
    {
        str += "<li>当视频暂停时，调整你所标注的内容。</li>";
    }
    str += "<li>我们会人工检查你的标注。</li>";
    str += "</ul>";
    h.append(str);

    h.append("<h2>入门指南</h2>");
    h.append("<img src='box.jpg' align='right'>");
    h.append("<p>点击<strong>新目标</strong>按钮来开始标注你的第一个目标。将屏幕上的光标定位在即将标注的目标的一角，使用十字准线对其你的点击，然后点击另一个角落就画好了一个盒子。矩形应该完全紧密的包围你正在标注的物体。如果有必要的话，可以通过拖动框的边缘来调整盒子。</p>");

    h.append("<img src='classify.jpg' align='right'>");
    h.append("<p>在新目标按钮的正下方右侧，你会发现一个彩色的盒子。这个盒子会提示你正在标注的目标的类型，点击恰当的提示内容。</p>");

    if (job.skip > 0)
    {
        h.append("<p>按下<strong>播放</strong>按钮。视频会播放。当视频自动暂停时，调整盒子。使用你的鼠标，拖放盒子至合适的位置，如有必要可调整盒子的大小. 重复这个过程直到你标记完整个视频。</p>");
    }
    else
    {
        h.append("<p>按下<strong>播放</strong>按钮。视频开始向前播放，当你正在追踪标记的目标已经远远移动了，点击<strong>暂停</strong>. 使用你的鼠标，拖放盒子至合适的位置，如有必要可调整盒子的大小. 重复这个过程直到你标记完整个视频。</p>");
    }

    if (job.perobject > 0)
    {
        h.append("<p>当你播放完整个视频，你应该点击重放按钮（在播放按钮旁）来重新播放视频，重复上述过程来标注视频中的所有目标 。如果你能在每一个影片视频中标注大量的目标是再好不过的，我们会奖励你为所标注的每一个目标。</p>");
    }
    else
    {
        h.append("<p>当你播放完整个视频，你应该点击重放按钮（在播放按钮旁）来重新播放视频，重复上述过程来标注视频中的所有目标 。如果你能在每一个影片视频中标注大量的目标是再好不过的，我们会奖励你为所标注的每一个目标。</p>");
    }

    h.append("<img src='outsideoccluded.jpg' align='right'>");
    h.append("<p>如果一个目标不再出现在该场景， 标记为<strong>在该视图帧之外</strong>  复选框（相应栏的矩形框）。确保你点击了正确的按钮. 当你的鼠标移动至某一控制按钮，相应的矩形框就会在屏幕上变亮。同样的，如过你正在追踪的目标仍然位于该帧，当时被遮挡的情况下，(例如，在车里)标记<strong>阻挡或阻塞</strong>复选框。 当这些目标再次出现，记得去掉之前点击的复选框。 如果有额外的描述属性的复选框，在系统要求的情况下标记这些盒子。比如对于行走中的人只标记“行走中”。</p>");

    h.append("<p>如果屏幕上有很多目标，很难选择合适的边界框，通过点击锁定按钮<img src='lock.jpg'> （位于一个目标的边栏框）来防止追踪过程中的变数。再次点击锁定按钮可以取消锁定。</p>");

    h.append("<p>盒子和物体之间的对应关系是很容易混淆的，当你在屏幕上点击一个盒子时会有工具提示你盒子的ID。</p>");
    
    h.append("<p>当你准备提交工作时，再次重新播放并仔细检查视频。在整个过程中是否每一个矩形都追寻着他所追踪的目标？如果你发现遗漏了某一个点，点击<strong>暂停</strong> 调整盒子。检查完工作之后，点击 <strong>暂停</strong>  调整盒子。检查完工作之后，点击 <strong>提交</strong>按钮。我们会尽快支付你。</p>");

    h.append("<h2>我们认可你的工作的标准</h2>");
    h.append("<p>我们将回顾你的工作并只接受高质量的工作，你的标注不会和其他工作者相比较。请遵循这些指导方针以确保你的工作被认可：</p>");

    h.append("<h3>标注每一个对象</h3>")
    h.append('<iframe title="YouTube video player" width="560" height="349" src="http://www.youtube.com/embed/H8cMZkz8Kbw?rel=0" frameborder="0" allowfullscreen></iframe>');
    //h.append("<img src='secret.png'>");
    //h.append("<img src='everyobject.jpg'>");

    if (job.perobject > 0)
    {
        h.append("<p>在整个视频中，每一个对象都应该被打上标签。以上工作被认可，是因为每一个目标都有包围的盒子。任何一个目标的漏标不应该超过一次及时目标没有移动，你也应该标注他。我们会奖励你为你所标记了每一个目标。</p>");
    }
    else
    {
        h.append("<p>在整个视频中，每一个对象都应该被打上标签。以上工作被认可，是因为每一个目标都有包围的盒子。任何一个目标的漏标不应该超过一次及时目标没有移动，你也应该标注他。我们会奖励你为你所标记了每一个目标。  </p>");
    }

    h.append("<h3>盒子紧密</h3>");
    h.append("<table><tr><td><img src='tight-good.jpg'></td><td><img src='tight-bad.jpg'></td></tr><tr><th>Good</th><th>Bad</th></tr></table>");
    h.append("<p>你所画的盒子必须紧密。所画的盒子必须尽可能的贴合目标。右边松散的标注会被拒绝，而左边紧密的标注将会被接受。</p>");

    h.append("<h3>标注整个视频</h3>")
    h.append("<img src='sequence1.jpg'> ");
    h.append("<img src='sequence3.jpg'> ");
    h.append("<img src='sequence4.jpg'><br>");
    h.append("<p>整个视频必须都被标注。当一个目标移动时，你需要更新他的位置。 一个盒子只能标注一个目标。一个盒子必须一直对应他所追踪的物体。</p>");

    h.append("<h3>消失和再次出现的物体</h3>");
    h.append("<p>为了确保你的工作被接受，你应该在他们离开和进入屏幕时打上相应的标签。我们希望你标注上目标进入和离开屏幕的时间。通常很难找到他们进入和离开屏幕的确切时间，我们允许你的标注出现轻微的误差。</p>");

    h.append("<img src='entering1.png'> <img src='entering2.png'> <img src='entering3.png'> <img src='entering4.png'><br>");

    h.append("<p>如果一个目标进入另一个目标（比如一个人进入一辆车内），你应该在这帧之外标注出这个消失的目标。同样的, 当一个目标走出包围他的目标时，你也应该打上标注。</p>");

    h.append("<img src='outofcar1.png'> <img src='outofcar2.png'> <img src='outofcar3.png'> <br>");

    h.append("<p>如果一个目标消失后又再次出现，你应该在这帧里标注出他的回归。切记 <em>不要</em> 在他重新出现时以一个新物体来标注。只用在右侧的矩形框中找到相应的复选框，取消选中的<strong>在该视图帧之外</strong> 复选框并将盒子放在合适的位置。</p>");

    h.append("<h2>高级功能</h2>");
    h.append("<p>我们也为那些特别难的视频提供了一些高级工具，点击<strong>选择</strong> 按钮可以使用这些高级工具。</p>");
    h.append("<ul>" +
        "<li>点击<strong>禁用调整？</strong>将允许你调整盒子。当盒子特别小的时候这个选项是很有帮助的。</li>" +
        "<li>点击<strong>隐藏盒子？</strong> 会暂时隐藏屏幕上的盒子。当屏幕变得很拥挤时这个选项是很有帮助的。记得再次点击使盒子重新出现在屏幕！</li>" +
        "<li>按钮 <strong>慢放</strong>, <strong>正常</strong>, <strong>快进</strong> 会改变视频的回放速度。如果视频内容很混乱，慢放视频会很有帮助。</li>" +
    "</ul>");

    h.append("<h3>快捷键</h3>");
    h.append("<p>为方便起见，这些快捷键可用：</p>");
    h.append('<ul class="keyboardshortcuts">' +
        '<li><code>n</code> 创建一个新目标</li>' +
        '<li><code>t</code>暂停或播放视频</li>' +
        '<li><code>r</code> 倒回到视频的最开始</li>' +
        '<li><code>h</code> 隐藏或显现盒子（只有在点击选项按钮之后可用）</li>' +
        '<li><code>d</code> 向前跳播一大段视频</li>' +
        '<li><code>f</code> 向后跳播一大段视频</li>' +
        '<li><code>v</code> 向前跳播一小段视频</li>' +
        '<li><code>c</code> 向后跳播一小段视频</li>' +
        '</ul>');
}
