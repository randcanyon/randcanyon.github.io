document.body.onmousemove = function(e) {
  document.documentElement.style.setProperty (
  '--x', (
	e.clientX+window.scrollX
  )
  + 'px'
  );
  document.documentElement.style.setProperty (
  '--y', (
	e.clientY+window.scrollY
  ) 
  + 'px'
  );
}

// Initialize Lenis
const lenis = new Lenis({
  autoRaf: true,
});

// Listen for the scroll event and log the event data
lenis.on('scroll', (e) => {
  console.log(e);
});

window.addEventListener('scroll', function() {
	const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
	const documentHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
	const scrollPercentage = (scrollTop / documentHeight) * 100;

	const progress = document.getElementById('post-progress');
	if (progress != null) progress.style.width = scrollPercentage + "%";
});

function copyURLToClipboard() {
  navigator.clipboard.writeText(window.location.href)
	.then(() => {
	  confirmCopyURLToClipboard();
	})
	.catch(err => {
	  // Optional: Handle errors
	  console.error("Failed to copy: ", err);
	});
}

function ResetCopyURLToClipboard() {
	const shareConfirm = document.getElementById('share-confirm');
	shareConfirm.classList.remove('animate__animated', 'animate__faster', 'animate__fadeOut', 'animate__fadeIn');
	shareConfirm.classList.add('hidden');
}

function HideConfirmCopyURLToClipboard() {
	const shareConfirm = document.getElementById('share-confirm');
	shareConfirm.classList.add('animate__fadeOut');
	setTimeout(ResetCopyURLToClipboard, 500);
}

function confirmCopyURLToClipboard() {
	const shareConfirm = document.getElementById('share-confirm');
	shareConfirm.classList.remove('hidden');
	shareConfirm.classList.add('animate__animated', 'animate__faster', 'animate__fadeIn');
	setTimeout(HideConfirmCopyURLToClipboard, 1000);
}

document.body.addEventListener("mouseover", function(e) {
	if(e.target) {
		if(e.target.nodeName == "A" || e.target.nodeName == "BUTTON") {
			cursor.style.width = '36px';
	  		cursor.style.height = '36px';
	  	}
	}
});

document.body.addEventListener("mouseout", function(e) {
	if(e.target) {
		if(e.target.nodeName == "A" || e.target.nodeName == "BUTTON") {
			cursor.style.width = '24px';
			cursor.style.height = '24px';
  		}
	}
});

function showAll() {
	// Get all elements
	var allElements = document.querySelectorAll('.project'); 
  
	// Loop through the elements with the specified class and show them
	allElements.forEach(function(element) {
	  element.classList.remove('hidden');
	});
	
	// Get all elements with the specified class
	var selectFilter = document.querySelectorAll('#all');
	
	// Get all elements
	var allFilters = document.querySelectorAll('.filter'); 
	
	// Loop through all elements and hide them
	allFilters.forEach(function(element) {
	  element.classList.remove('filter-selected');
	});
	
	// Loop through the elements with the specified class and show them
	selectFilter.forEach(function(element) {
	  element.classList.add('filter-selected');
	});
}

function setFilter(filter) {
	// Get all elements with the specified class
	var selectFilter = document.querySelectorAll('#' + filter);
  
	// Get all elements
	var allFilters = document.querySelectorAll('.filter'); 
  
	// Loop through all elements and hide them
	allFilters.forEach(function(element) {
	  element.classList.remove('filter-selected');
	});
  
	// Loop through the elements with the specified class and show them
	selectFilter.forEach(function(element) {
	  element.classList.add('filter-selected');
	});
	
	// Get all elements with the specified class
	var showElements = document.querySelectorAll('.' + filter);
	
	// Get all elements
	var allElements = document.querySelectorAll('.project'); 
	
	// Loop through all elements and hide them
	allElements.forEach(function(element) {
	  element.classList.add('hidden');
	});
	
	// Loop through the elements with the specified class and show them
	showElements.forEach(function(element) {
	  element.classList.remove('hidden');
	});
}

function setHeaderHeightVar() {
	const h = document.querySelector('header');
	if (!h) return;
	const safeTop = parseFloat(getComputedStyle(document.documentElement).getPropertyValue('env(safe-area-inset-top)')) || 0;
	const headerH = h.offsetHeight + safeTop;
	document.documentElement.style.setProperty('--header-h', headerH + 'px');
}

window.addEventListener('load', setHeaderHeightVar);
window.addEventListener('resize', setHeaderHeightVar);

// Fade out on link click
document.addEventListener('DOMContentLoaded', function() {
	const links = document.querySelectorAll('a:not([target="_blank"])');
	const page = document.querySelector('.page');
	
	links.forEach(link => {
		link.addEventListener('click', function(e) {
			// Only fade for internal links
			if (this.hostname === window.location.hostname) {
				e.preventDefault();
				const href = this.getAttribute('href');
				
				page.classList.add('fade-out');
				
				setTimeout(() => {
					window.location.href = href;
				}, 300); // Match CSS transition duration
			}
		});
	});
});

// Color mode toggle
const theme = localStorage.getItem('theme') || 'light';
document.documentElement.setAttribute('data-theme', theme);

document.getElementById('theme-toggle')?.addEventListener('click', () => {
  const currentTheme = document.documentElement.getAttribute('data-theme');
  const newTheme = currentTheme === 'light' ? 'dark' : 'light';
  document.documentElement.setAttribute('data-theme', newTheme);
  localStorage.setItem('theme', newTheme);
});

// Fade in on page load
window.addEventListener('pageshow', function() {
	const page = document.querySelector('.page');
	page.classList.remove('fade-out');
});

// Parallax effect for hero images
window.addEventListener('scroll', () => {
	const scrolled = window.pageYOffset;
	const parallaxElements = document.querySelectorAll('.hero-image-parallax');
	
	parallaxElements.forEach(element => {
		const speed = 0.2; // Adjust for parallax intensity (0.5 = half speed)
		element.style.transform = `translateY(${scrolled * speed}px)`;
	});
});

// Slideshow
(function() {
	function initScrollFade() {
		const scrollContainers = document.querySelectorAll('[data-scroll-fade]');
		
		if (scrollContainers.length === 0) {
			console.log('No scroll containers found');
			return;
		}
		
		scrollContainers.forEach(container => {
			function updateMask() {
				const scrollLeft = container.scrollLeft;
				const maxScroll = container.scrollWidth - container.clientWidth;
				const fadeWidth = 100;
				
				if (maxScroll <= 0) {
					// No scrolling needed, no mask
					container.style.maskImage = 'none';
					container.style.webkitMaskImage = 'none';
					return;
				}
				
				// Calculate fade amounts (0 to 1)
				const leftFade = Math.min(scrollLeft / fadeWidth, 1);
				const rightFade = Math.min((maxScroll - scrollLeft) / fadeWidth, 1);
				
				// Calculate pixel positions
				const leftStop = fadeWidth * leftFade;
				const rightStop = container.clientWidth - (fadeWidth * rightFade);
				
				const maskImage = `linear-gradient(to right, transparent 0, black ${leftStop}px, black ${rightStop}px, transparent 100%)`;
				
				container.style.maskImage = maskImage;
				container.style.webkitMaskImage = maskImage;
			}
			
			// Update on scroll
			container.addEventListener('scroll', updateMask);
			
			// Update on resize
			window.addEventListener('resize', updateMask);
			
			// Initial update with slight delay to ensure content is loaded
			setTimeout(updateMask, 100);
		});
	}
	
	// Run on DOM ready
	if (document.readyState === 'loading') {
		document.addEventListener('DOMContentLoaded', initScrollFade);
	} else {
		initScrollFade();
	}
})();