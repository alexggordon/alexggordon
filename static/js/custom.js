document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll(".embla").forEach((wrapperNode) => {
    if (typeof window.EmblaCarousel !== "function") {
      return;
    }

    const viewportNode = wrapperNode.querySelector(".embla__viewport");
    const prevButtonNode = wrapperNode.querySelector(".embla__prev");
    const nextButtonNode = wrapperNode.querySelector(".embla__next");
    const dotsNode = wrapperNode.querySelector(".embla__dots");

    if (!viewportNode) {
      return;
    }

    const slideNodes = Array.from(wrapperNode.querySelectorAll(".embla__slide"));
    if (slideNodes.length <= 1) {
      wrapperNode.classList.add("is-single");
      return;
    }

    const emblaApi = window.EmblaCarousel(viewportNode, {
      align: "start",
      loop: false,
    });

    let dotNodes = [];

    const addDotButtons = () => {
      if (!dotsNode) {
        return;
      }

      dotsNode.innerHTML = emblaApi
        .scrollSnapList()
        .map((_, index) => `<button class="embla__dot" type="button" aria-label="Show image ${index + 1}"></button>`)
        .join("");

      dotNodes = Array.from(dotsNode.querySelectorAll(".embla__dot"));
      dotNodes.forEach((dotNode, index) => {
        dotNode.addEventListener("click", () => emblaApi.scrollTo(index), false);
      });
    };

    const toggleButtons = () => {
      prevButtonNode?.toggleAttribute("disabled", !emblaApi.canScrollPrev());
      nextButtonNode?.toggleAttribute("disabled", !emblaApi.canScrollNext());
    };

    const toggleDots = () => {
      const selectedIndex = emblaApi.selectedScrollSnap();
      dotNodes.forEach((dotNode, index) => {
        const isSelected = index === selectedIndex;
        dotNode.classList.toggle("embla__dot--selected", isSelected);
        dotNode.setAttribute("aria-pressed", String(isSelected));
      });
    };

    addDotButtons();
    toggleButtons();
    toggleDots();

    prevButtonNode?.addEventListener("click", () => emblaApi.scrollPrev(), false);
    nextButtonNode?.addEventListener("click", () => emblaApi.scrollNext(), false);

    wrapperNode.addEventListener("keydown", (event) => {
      if (event.key === "ArrowLeft") {
        event.preventDefault();
        emblaApi.scrollPrev();
      }

      if (event.key === "ArrowRight") {
        event.preventDefault();
        emblaApi.scrollNext();
      }
    });

    emblaApi.on("reInit", () => {
      addDotButtons();
      toggleButtons();
      toggleDots();
    });
    emblaApi.on("select", toggleButtons);
    emblaApi.on("select", toggleDots);
  });
});
