
function validateName() {
    // 이름 필드의 값을 가져옵니다.
    var name = document.getElementById("name").value;

    // 이름이 공백인지 확인합니다.
    if (name.trim() === "") {
        alert("이름을 입력해 주세요.");
        return false;
    }

    // 이름의 길이가 6자 이하인지 확인합니다.
    if (name.length > 6) {
        alert("이름은 6자 이하여야 합니다.");
        return false;
    }

    // 모든 유효성 검사를 통과하면 양식을 제출합니다.
    return true;
}
