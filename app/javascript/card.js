const pay = () => {
  Payjp.setPublicKey("pk_test_db07b946bc336fbe89364b26");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    console.log("フォーム送信時にイベント発火");
  });
};

window.addEventListener("load", pay);
