// FAQ accordion
function toggleFaq(el) {
  const item = el.closest('.faq-item');
  const isOpen = item.classList.contains('open');
  document.querySelectorAll('.faq-item').forEach(i => i.classList.remove('open'));
  if (!isOpen) item.classList.add('open');
}

// Mobile nav toggle
function toggleMobileNav() {
  const nav = document.querySelector('nav');
  const hamburger = document.querySelector('.hamburger');
  const overlay = document.querySelector('.nav-overlay');
  nav.classList.toggle('open');
  hamburger.classList.toggle('active');
  overlay.classList.toggle('show');
  document.body.style.overflow = nav.classList.contains('open') ? 'hidden' : '';
}

// Mobile dropdown toggle
function toggleDropdown(el) {
  if (window.innerWidth > 960) return;
  const dropdown = el.closest('.nav-dropdown');
  const wasOpen = dropdown.classList.contains('open');
  document.querySelectorAll('.nav-dropdown').forEach(d => d.classList.remove('open'));
  if (!wasOpen) dropdown.classList.add('open');
}

// Sport tab switcher
document.querySelectorAll('.sport-tab').forEach(tab => {
  tab.addEventListener('click', function() {
    document.querySelectorAll('.sport-tab').forEach(t => t.classList.remove('active'));
    this.classList.add('active');
  });
});

// Odds flicker
function flickerOdds() {
  document.querySelectorAll('.odds-box').forEach(box => {
    if (Math.random() > 0.85) {
      const base = parseFloat(box.textContent);
      if (isNaN(base)) return;
      const delta = (Math.random() - 0.5) * 0.04;
      box.textContent = (base + delta).toFixed(2);
      box.style.color = delta > 0 ? '#06d6a0' : '#ff3158';
      setTimeout(() => { box.style.color = ''; }, 700);
    }
  });
}
setInterval(flickerOdds, 2000);
