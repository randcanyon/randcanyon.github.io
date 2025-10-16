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

const card = document.getElementById('card');

card.addEventListener('mousemove', (e) => {
	const rect = card.getBoundingClientRect();
	const centerX = rect.left + rect.width / 2;
	const centerY = rect.top + rect.height / 2;
	
	const mouseX = e.clientX;
	const mouseY = e.clientY;
	
	const rotateX = (mouseY - centerY) / 40;
	const rotateY = (centerX - mouseX) / 40;
	
	card.style.transform = `rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;
});

card.addEventListener('mouseleave', () => {
	card.style.transform = 'rotateX(0) rotateY(0)';
});

/* 
window.addEventListener('scroll', function() {
  const projects = document.getElementById('projects');
  const projectsTop = projects.getBoundingClientRect().top;
  const projectsHeight = projects.getBoundingClientRect().height;
  const projectsBottom = projects.getBoundingClientRect().bottom;
  
  const sidebar = document.getElementById('filters');
  const sidebarHeight = sidebar.getBoundingClientRect().height;

  console.log("side" + sidebarHeight);
  console.log("project" + projectsHeight);

  if (sidebarHeight < projectsHeight) {
  	if (projectsTop <= 190) {
		sidebar.style.paddingTop = 190 - projectsTop + "px";
  	} else {
		sidebar.style.paddingTop = 0;
  	}
  } else {
    if (projectsBottom >= 190) {
		sidebar.style.paddingTop = 190 - projectsTop + "px";
	  } else {
		sidebar.style.paddingTop = 0;
	  }
  }
});
*/

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

// Fade in on page load
window.addEventListener('pageshow', function() {
	const page = document.querySelector('.page');
	page.classList.remove('fade-out');
});