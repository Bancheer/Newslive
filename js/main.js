// NewsLive — basic interactivity
(function () {
  // Live clock in the header (Katowice, Europe/Warsaw)
  var clockEl = document.querySelector('[data-clock]');
  var ampmEl = document.querySelector('[data-ampm]');
  function tick() {
    if (!clockEl) return;
    try {
      var parts = new Intl.DateTimeFormat('en-US', {
        hour: '2-digit', minute: '2-digit', hour12: true, timeZone: 'Europe/Warsaw'
      }).formatToParts(new Date());
      var get = function (t) { var p = parts.find(function (x) { return x.type === t; }); return p ? p.value : ''; };
      clockEl.textContent = get('hour') + ':' + get('minute');
      if (ampmEl) ampmEl.textContent = get('dayPeriod').toUpperCase();
    } catch (e) { /* keep static value */ }
  }
  tick();
  setInterval(tick, 15000);

  // Mobile menu
  var burger = document.querySelector('[data-burger]');
  var nav = document.querySelector('[data-nav]');
  if (burger && nav) {
    burger.addEventListener('click', function () {
      var open = nav.classList.toggle('is-open');
      burger.setAttribute('aria-expanded', open ? 'true' : 'false');
    });
  }

  // Subscribe forms (front-end only for now)
  document.querySelectorAll('[data-subscribe]').forEach(function (form) {
    form.addEventListener('submit', function (e) {
      e.preventDefault();
      var input = form.querySelector('input[type="email"]');
      if (!input || !input.checkValidity()) { input && input.reportValidity(); return; }
      var btn = form.querySelector('button');
      form.classList.add('is-done');
      if (btn) btn.textContent = 'THANK YOU!';
      input.value = '';
      setTimeout(function () {
        form.classList.remove('is-done');
        if (btn) btn.textContent = 'SUBSCRIBE';
      }, 3000);
    });
  });

  // Current year in the footer
  var y = document.querySelector('[data-year]');
  if (y) y.textContent = new Date().getFullYear();
})();
