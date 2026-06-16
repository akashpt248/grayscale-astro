(function () {
  const widgetId = 'performance-lab-third-party-widget';

  function createWidget() {
    const existing = document.getElementById(widgetId);

    if (existing) {
      return existing;
    }

    const widget = document.createElement('aside');
    widget.id = widgetId;
    widget.className = 'third-party-widget';
    widget.innerHTML = `
      <div class="third-party-widget__title">
        <strong>Simulated widget</strong>
        <span>third-party payload</span>
      </div>
      <p>This local script behaves like an ad, analytics, or chat embed.</p>
      <div class="third-party-widget__stats">
        <span data-widget-frames>0</span>
        <span data-widget-score>0</span>
      </div>
      <button type="button" class="btn btn-sm btn-light">Refresh widget</button>
    `;

    document.body.append(widget);

    return widget;
  }

  let frameId = 0;
  let mounted = false;

  function mount(host) {
    const widget = createWidget();
    const frameCounter = widget.querySelector('[data-widget-frames]');
    const scoreCounter = widget.querySelector('[data-widget-score]');
    const button = widget.querySelector('button');

    if (mounted) {
      return;
    }

    mounted = true;

    let frames = 0;
    let score = 0;

    const loop = () => {
      frames += 1;
      score = 0;

      for (let index = 0; index < 8000; index += 1) {
        score += Math.sqrt(index + frames) % 11;
      }

      if (frameCounter) {
        frameCounter.textContent = String(frames);
      }

      if (scoreCounter) {
        scoreCounter.textContent = score.toFixed(0);
      }

      widget.style.setProperty('--widget-tilt', `${(frames % 12) - 6}deg`);
      frameId = window.requestAnimationFrame(loop);
    };

    button?.addEventListener('click', () => {
      widget.classList.add('is-hot');
      window.setTimeout(() => widget.classList.remove('is-hot'), 400);
    });

    if (host) {
      host.append(widget);
    }

    loop();
  }

  function destroy() {
    mounted = false;
    window.cancelAnimationFrame(frameId);
    const widget = document.getElementById(widgetId);

    if (widget) {
      widget.remove();
    }
  }

  window.PerformanceLabThirdParty = {
    mount,
    destroy,
  };
})();

