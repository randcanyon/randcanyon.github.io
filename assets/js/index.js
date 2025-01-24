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