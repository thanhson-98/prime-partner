// =========================================
// PRIME PARTNER — 共通スクリプト
//  - スクロール時のヘッダー切り替え
//  - SPハンバーガーメニュー開閉
// =========================================
(function () {
  'use strict';

  // ----- スクロールヘッダー切り替え -----
  var heroHeader = document.getElementById('heroHeader');
  var scrollHeader = document.getElementById('scrollHeader');
  var heroSection = document.querySelector('.hero');

  function onScroll() {
    var threshold = heroSection ? heroSection.offsetHeight - 130 : 600;
    var scrolled = window.scrollY > threshold;
    scrollHeader.classList.toggle('is-visible', scrolled);
    scrollHeader.setAttribute('aria-hidden', String(!scrolled));
    heroHeader.style.visibility = scrolled ? 'hidden' : 'visible';
  }
  window.addEventListener('scroll', onScroll, { passive: true });
  onScroll();

  // ----- SPメニュー -----
  var spMenu = document.getElementById('spMenu');
  var openBtns = [document.getElementById('menuOpen'), document.getElementById('menuOpen2')];
  var closeBtn = document.getElementById('menuClose');

  function openMenu() {
    spMenu.classList.add('is-open');
    spMenu.setAttribute('aria-hidden', 'false');
    openBtns.forEach(function (b) { if (b) b.setAttribute('aria-expanded', 'true'); });
  }
  function closeMenu() {
    spMenu.classList.remove('is-open');
    spMenu.setAttribute('aria-hidden', 'true');
    openBtns.forEach(function (b) { if (b) b.setAttribute('aria-expanded', 'false'); });
  }

  openBtns.forEach(function (b) { if (b) b.addEventListener('click', openMenu); });
  if (closeBtn) closeBtn.addEventListener('click', closeMenu);

  // メニュー内リンクをタップしたら閉じる
  spMenu.querySelectorAll('a').forEach(function (a) {
    a.addEventListener('click', closeMenu);
  });

  // メニュー外クリックで閉じる
  document.addEventListener('click', function (e) {
    if (
      spMenu.classList.contains('is-open') &&
      !spMenu.contains(e.target) &&
      !openBtns.some(function (b) { return b && b.contains(e.target); })
    ) {
      closeMenu();
    }
  });
})();
