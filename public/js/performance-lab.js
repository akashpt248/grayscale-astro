window.addEventListener('DOMContentLoaded', () => {
  const root = document.querySelector('[data-performance-lab]');

  if (!root) {
    return;
  }

  const baseState = {
    motion: false,
    datasetSize: 'small',
    concurrentRequests: 1,
    imageCount: 0,
    domCount: 24,
    thirdParty: false,
    interactive: false,
    infinite: false,
    batchSize: 24,
    requestVariant: 'small',
    sortMode: 'score',
    query: '',
  };

  const presetMap = {
    baseline: {
      motion: false,
      datasetSize: 'small',
      concurrentRequests: 1,
      imageCount: 0,
      domCount: 24,
      thirdParty: false,
      interactive: false,
      infinite: false,
      batchSize: 24,
      requestVariant: 'small',
    },
    motion: {
      motion: true,
      datasetSize: 'small',
      concurrentRequests: 1,
      imageCount: 2,
      domCount: 80,
      thirdParty: false,
      interactive: true,
      infinite: false,
      batchSize: 24,
      requestVariant: 'medium',
    },
    data: {
      motion: true,
      datasetSize: 'large',
      concurrentRequests: 4,
      imageCount: 6,
      domCount: 180,
      thirdParty: false,
      interactive: true,
      infinite: true,
      batchSize: 36,
      requestVariant: 'large',
    },
    max: {
      motion: true,
      datasetSize: 'large',
      concurrentRequests: 6,
      imageCount: 12,
      domCount: 420,
      thirdParty: true,
      interactive: true,
      infinite: true,
      batchSize: 48,
      requestVariant: 'large',
    },
  };

  const els = {
    presetButtons: Array.from(root.querySelectorAll('[data-preset]')),
    motionToggle: root.querySelector('#motionToggle'),
    dataToggle: root.querySelector('#dataToggle'),
    concurrentRequests: root.querySelector('#concurrentRequests'),
    imageCount: root.querySelector('#imageCount'),
    domCount: root.querySelector('#domCount'),
    thirdPartyToggle: root.querySelector('#thirdPartyToggle'),
    interactiveToggle: root.querySelector('#interactiveToggle'),
    infiniteToggle: root.querySelector('#infiniteToggle'),
    datasetSize: root.querySelector('#datasetSize'),
    batchSize: root.querySelector('#batchSize'),
    sortMode: root.querySelector('#sortMode'),
    query: root.querySelector('#query'),
    loadDataset: root.querySelector('#loadDataset'),
    refreshRequests: root.querySelector('#refreshRequests'),
    dataSummary: root.querySelector('#dataSummary'),
    requestSummary: root.querySelector('#requestSummary'),
    imageGrid: root.querySelector('#imageGrid'),
    domGrid: root.querySelector('#domGrid'),
    datasetList: root.querySelector('#datasetList'),
    feedList: root.querySelector('#feedList'),
    feedSentinel: root.querySelector('#feedSentinel'),
    motionStage: root.querySelector('#motionStage'),
    thirdPartyStatus: root.querySelector('#thirdPartyStatus'),
    metrics: {
      frames: root.querySelector('[data-metric="frames"]'),
      items: root.querySelector('[data-metric="items"]'),
      requests: root.querySelector('[data-metric="requests"]'),
      images: root.querySelector('[data-metric="images"]'),
      dom: root.querySelector('[data-metric="dom"]'),
      widget: root.querySelector('[data-metric="widget"]'),
    },
  };

  const state = {
    ...baseState,
  };

  const imageSource = root.dataset.heroImage || '/assets/img/bg-masthead.jpg';
  const endpoints = {
    small: '/api/stress-small.json',
    medium: '/api/stress-medium.json',
    large: '/api/stress-large.json',
  };

  let dataset = [];
  let feedCursor = 0;
  let feedObserver;
  let thirdPartyLoader;
  let thirdPartyMounted = false;
  let frameCount = 0;
  let animationId = 0;
  let lastFrameTime = performance.now();
  let loadedRequests = 0;

  function setSummary(target, value) {
    if (target) {
      target.textContent = value;
    }
  }

  function readNumber(input, fallback) {
    const value = Number.parseInt(input?.value ?? '', 10);
    return Number.isFinite(value) ? value : fallback;
  }

  function syncControls() {
    els.motionToggle.checked = state.motion;
    els.dataToggle.checked = state.datasetSize !== 'small';
    els.concurrentRequests.value = String(state.concurrentRequests);
    els.imageCount.value = String(state.imageCount);
    els.domCount.value = String(state.domCount);
    els.thirdPartyToggle.checked = state.thirdParty;
    els.interactiveToggle.checked = state.interactive;
    els.infiniteToggle.checked = state.infinite;
    els.datasetSize.value = state.datasetSize;
    els.batchSize.value = String(state.batchSize);
  }

  function updateMetrics() {
    setSummary(els.metrics.frames, `${frameCount} frames`);
    setSummary(els.metrics.items, `${dataset.length} items`);
    setSummary(els.metrics.requests, `${loadedRequests} requests`);
    setSummary(els.metrics.images, `${state.imageCount} images`);
    setSummary(els.metrics.dom, `${state.domCount} cards`);
    setSummary(els.metrics.widget, state.thirdParty ? 'mounted' : 'idle');
  }

  function updateMotionStage() {
    root.classList.toggle('motion-enabled', state.motion);
    els.motionStage?.classList.toggle('is-active', state.motion);
  }

  function renderImageGrid() {
    if (!els.imageGrid) {
      return;
    }

    els.imageGrid.innerHTML = '';

    const count = state.imageCount;

    for (let index = 0; index < count; index += 1) {
      const card = document.createElement('figure');
      card.className = 'lab-image-card';
      card.innerHTML = `
        <img
          src="${imageSource}"
          alt="Stress test media sample ${index + 1}"
          width="1600"
          height="900"
          loading="eager"
          decoding="async"
        />
        <figcaption>Media asset ${String(index + 1).padStart(2, '0')}</figcaption>
      `;
      els.imageGrid.append(card);
    }
  }

  function renderDomGrid(items) {
    if (!els.domGrid) {
      return;
    }

    const source = items.length > 0 ? items : createFallbackItems(state.domCount);
    const targetCount = Math.max(state.domCount, 0);
    const fragments = document.createDocumentFragment();

    els.domGrid.innerHTML = '';

    for (let index = 0; index < targetCount; index += 1) {
      const item = source[index % source.length];
      const article = document.createElement('article');
      article.className = `lab-data-card accent-${item.accent}`;
      article.innerHTML = `
        <div class="lab-data-card__header">
          <span>${item.category}</span>
          <strong>${String(index + 1).padStart(3, '0')}</strong>
        </div>
        <h3>${item.title}</h3>
        <p>${item.summary}</p>
        <dl class="lab-data-card__meta">
          <div><dt>Score</dt><dd>${item.score}</dd></div>
          <div><dt>State</dt><dd>${state.interactive ? 'live' : 'static'}</dd></div>
        </dl>
      `;
      fragments.append(article);
    }

    els.domGrid.append(fragments);
  }

  function renderDataList(items) {
    if (!els.datasetList) {
      return;
    }

    const visible = items.slice(0, Math.max(24, Math.min(120, items.length)));
    const fragment = document.createDocumentFragment();

    els.datasetList.innerHTML = '';

    visible.forEach((item) => {
      const li = document.createElement('li');
      li.className = 'lab-feed-item';
      li.innerHTML = `
        <strong>${item.title}</strong>
        <span>${item.category}</span>
        <p>${item.summary}</p>
      `;
      fragment.append(li);
    });

    els.datasetList.append(fragment);
  }

  function renderFeed(items) {
    if (!els.feedList) {
      return;
    }

    const fragment = document.createDocumentFragment();

    items.slice(feedCursor, feedCursor + state.batchSize).forEach((item) => {
      const article = document.createElement('article');
      article.className = 'lab-feed-card';
      article.innerHTML = `
        <strong>${item.title}</strong>
        <p>${item.summary}</p>
      `;
      fragment.append(article);
    });

    feedCursor += state.batchSize;
    els.feedList.append(fragment);
  }

  function resetFeed(items) {
    if (!els.feedList) {
      return;
    }

    feedCursor = 0;
    els.feedList.innerHTML = '';
    renderFeed(items);
    observeFeed(items);
  }

  function observeFeed(items) {
    if (!els.feedSentinel || !state.infinite) {
      feedObserver?.disconnect();
      return;
    }

    feedObserver?.disconnect();
    feedObserver = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (!entry.isIntersecting) {
          return;
        }

        if (feedCursor >= items.length) {
          return;
        }

        renderFeed(items);
      });
    }, { rootMargin: '120px' });

    feedObserver.observe(els.feedSentinel);
  }

  function createFallbackItems(count) {
    return Array.from({ length: Math.max(1, count) }, (_, index) => ({
      id: `fallback-${index + 1}`,
      title: `Fallback ${String(index + 1).padStart(3, '0')}`,
      category: 'Fallback',
      score: 100 - (index % 40),
      summary: 'Synthetic content used until the API payload is loaded.',
      accent: ['indigo', 'teal', 'amber', 'rose'][index % 4],
    }));
  }

  function filterAndSortItems() {
    const query = state.query.trim().toLowerCase();
    const sorted = [...dataset].sort((left, right) => {
      if (state.sortMode === 'score') {
        return right.score - left.score;
      }

      return left.title.localeCompare(right.title);
    });

    return query
      ? sorted.filter((item) => {
          return (
            item.title.toLowerCase().includes(query) ||
            item.category.toLowerCase().includes(query) ||
            item.summary.toLowerCase().includes(query)
          );
        })
      : sorted;
  }

  function renderAll() {
    const filtered = filterAndSortItems();

    renderImageGrid();
    renderDomGrid(filtered);
    renderDataList(filtered);
    if (state.infinite) {
      resetFeed(filtered);
    } else if (els.feedList) {
      els.feedList.innerHTML = '';
      feedObserver?.disconnect();
    }
    updateMotionStage();
    updateMetrics();
    setSummary(els.dataSummary, `${filtered.length} rendered items`);
    setSummary(els.requestSummary, `${state.concurrentRequests} concurrent fetch${state.concurrentRequests === 1 ? '' : 'es'}`);
  }

  async function loadDataset(size = state.datasetSize, force = false) {
    if (!force && dataset.length > 0 && size === state.datasetSize) {
      renderAll();
      return;
    }

    const endpoint = endpoints[size] ?? endpoints.small;
    const response = await fetch(`${endpoint}?v=${Date.now()}`, { cache: 'no-store' });
    const payload = await response.json();
    dataset = Array.isArray(payload.items) ? payload.items : [];
    loadedRequests += 1;
    renderAll();
  }

  async function refreshConcurrentRequests() {
    const endpoint = endpoints[state.datasetSize] ?? endpoints.small;
    const requestTotal = Math.max(1, state.concurrentRequests);
    const requests = Array.from({ length: requestTotal }, (_, index) => {
      return fetch(`${endpoint}?slot=${index}&v=${Date.now() + index}`, { cache: 'no-store' }).then((response) => response.json());
    });

    setSummary(els.requestSummary, `${requestTotal} concurrent fetch${requestTotal === 1 ? '' : 'es'} in flight`);
    const responses = await Promise.all(requests);
    dataset = responses.flatMap((response) => (Array.isArray(response.items) ? response.items : []));
    loadedRequests += requestTotal;
    renderAll();
  }

  async function mountThirdParty() {
    if (!state.thirdParty) {
      window.PerformanceLabThirdParty?.destroy?.();
      thirdPartyMounted = false;
      setSummary(els.thirdPartyStatus, 'idle');
      updateMetrics();
      return;
    }

    if (!thirdPartyLoader) {
      thirdPartyLoader = new Promise((resolve, reject) => {
        const script = document.createElement('script');
        script.src = '/js/stress-third-party.js';
        script.async = true;
        script.onload = () => resolve();
        script.onerror = () => reject(new Error('Failed to load the simulated widget script.'));
        document.head.append(script);
      });
    }

    await thirdPartyLoader;
    window.PerformanceLabThirdParty?.mount?.(root.querySelector('#widgetHost'));
    thirdPartyMounted = true;
    setSummary(els.thirdPartyStatus, 'mounted');
    updateMetrics();
  }

  function startFrameLoop() {
    const loop = (time) => {
      frameCount += 1;
      const elapsed = time - lastFrameTime;

      if (elapsed >= 1000) {
        frameCount = 0;
        lastFrameTime = time;
      }

      if (state.motion) {
        const dial = root.querySelector('[data-motion-dial]');
        if (dial) {
          const rotation = (time / 10) % 360;
          dial.style.setProperty('--rotation', `${rotation.toFixed(2)}deg`);
        }
      }

      updateMetrics();
      animationId = window.requestAnimationFrame(loop);
    };

    animationId = window.requestAnimationFrame(loop);
  }

  function applyPreset(presetName) {
    const preset = presetMap[presetName] ?? presetMap.baseline;
    Object.assign(state, baseState, preset);
    syncControls();
    loadDataset(state.datasetSize, true).catch((error) => {
      console.error(error);
    });
    if (state.concurrentRequests > 1) {
      refreshConcurrentRequests().catch((error) => {
        console.error(error);
      });
    }
    mountThirdParty().catch((error) => {
      console.error(error);
    });
    renderAll();
  }

  function bindInput(input, key, transform = (value) => value) {
    input?.addEventListener('input', () => {
      state[key] = transform(input.type === 'checkbox' ? input.checked : input.value);
      if (key === 'datasetSize') {
        syncControls();
        loadDataset(state.datasetSize, true).catch((error) => {
          console.error(error);
        });
      } else if (key === 'thirdParty') {
        mountThirdParty().catch((error) => {
          console.error(error);
        });
      } else {
        renderAll();
      }
    });
  }

  els.presetButtons.forEach((button) => {
    button.addEventListener('click', () => {
      applyPreset(button.dataset.preset ?? 'baseline');
    });
  });

  bindInput(els.motionToggle, 'motion');
  bindInput(els.dataToggle, 'datasetSize', (checked) => (checked ? 'large' : 'small'));
  bindInput(els.concurrentRequests, 'concurrentRequests', (value) => Number.parseInt(value, 10));
  bindInput(els.imageCount, 'imageCount', (value) => Number.parseInt(value, 10));
  bindInput(els.domCount, 'domCount', (value) => Number.parseInt(value, 10));
  bindInput(els.thirdPartyToggle, 'thirdParty');
  bindInput(els.interactiveToggle, 'interactive');
  bindInput(els.infiniteToggle, 'infinite');
  bindInput(els.datasetSize, 'datasetSize');
  bindInput(els.batchSize, 'batchSize', (value) => Number.parseInt(value, 10));

  els.sortMode?.addEventListener('change', () => {
    state.sortMode = els.sortMode.value;
    renderAll();
  });

  els.query?.addEventListener('input', () => {
    state.query = els.query.value;
    renderAll();
  });

  els.loadDataset?.addEventListener('click', () => {
    loadDataset(state.datasetSize, true).catch((error) => {
      console.error(error);
    });
  });

  els.refreshRequests?.addEventListener('click', () => {
    refreshConcurrentRequests().catch((error) => {
      console.error(error);
    });
  });

  window.addEventListener('beforeunload', () => {
    window.cancelAnimationFrame(animationId);
    feedObserver?.disconnect();
    window.PerformanceLabThirdParty?.destroy?.();
  });

  syncControls();
  updateMotionStage();
  startFrameLoop();
  loadDataset(state.datasetSize, true)
    .then(() => {
      renderAll();
    })
    .catch((error) => {
      console.error(error);
      dataset = createFallbackItems(state.domCount);
      renderAll();
    });
  mountThirdParty().catch((error) => {
    console.error(error);
  });
});
