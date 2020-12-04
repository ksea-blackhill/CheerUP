const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY1);
  const artistForm = document.getElementById("artist-form");
  artistForm.addEventListener('submit', (e) => {
    e.preventDefault();
    
    const artistFormResult = document.getElementById("artist-form");
    const artistFormData   = new FormData(artistFormResult);

    const card = {
      number:     artistFormData.get("artist_form[number]"),
      cvc:        artistFormData.get("artist_form[cvc]"),
      exp_month:  artistFormData.get("artist_form[exp_month]"),
      exp_year:   `20${artistFormData.get("artist_form[exp_year]")}`
    };

    Payjp.createToken(card, (status,response) => {
      if(status == 200){
        const token = response.id;
        const renderDom = document.getElementById("artist-form");
        const tokenObj = `<input value=${token} name='token' type='hidden'>`;
        renderDom.insertAdjacentHTML("beforeend",tokenObj);
      }  

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("artist-form").submit();
    });
  });
};

window.addEventListener('load', pay);