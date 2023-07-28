function shareAlert(articleId){
    alert("localhost:3000/article/" + articleId);
}

function confirmPublish(articleId){
    let confirmed = confirm("Are you sure you want to publish this article?");

    if(confirmed){
        window.location.href = '/author/publish/' + articleId;
    }
}

function confirmDraftDelete(articleId){
    let confirmed = confirm("Are you sure you want to delete this article?");

    if(confirmed){
        window.location.href = '/author/delete/' + articleId;
    }
}

function confirmPublishDelete(articleId){
    let confirmed = confirm("Are you sure you want to delete this article?");

    if(confirmed){
        window.location.href = '/author/delete-published/' + articleId;
    }
}