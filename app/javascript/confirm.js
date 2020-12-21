/*削除機能を使うときに表示させたい内容(勉強中)*/
window.addEventListener('load', () => {
  const artistDestroy = document.getElementById('artist-destroy')
  artistDestroy.addEventListener('click', (e) => {
    e.preventDefault();
    window.confirm('本当に削除しますか？')
    e.preventDefault();
    if(true){
      window.alert('削除が完了しました。')
    };
  });
});