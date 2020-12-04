const pay = () => {
  Payjp.setPublicKey("pk_test_d6609db2074f93f120a97b49"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("form_object[number]"),
      cvc: formData.get("form_object[cvc]"),
      exp_month: formData.get("form_object[exp_month]"),
      exp_year: `20${formData.get("form_object[exp_year]")}`,
    };
    console.log(card)
    // debugger
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);