function PaginationClick(page) {
    console.log(page);
    document.getElementById("page").value = page;
    document.getElementById("form").submit();
}