/**
 * 
 */
CKEDITOR.plugins.add( 'chart', {
	requires: 'dialog',
	icons: 'chart', 
	init: function( editor ) {
		if ( editor.blockless )
			return;

		var chart = CKEDITOR.plugins.chart;

		editor.addCommand( 'chart', new CKEDITOR.dialogCommand( 'chart', {
			context: 'chart',
			allowedContent: 'chart{width,height}[align,border,cellpadding,cellspacing,summary];' +
				'caption tbody thead tfoot;' +
				'th td tr[scope];' +
				( editor.plugins.dialogadvtab ? 'chart' + editor.plugins.dialogadvtab.allowedContent() : '' ),
			requiredContent: 'chart',
			contentTransformations: [
				[ 'chart{width}: sizeToStyle', 'chart[width]: sizeToAttribute' ]
			]
		} ) );

		function createDef( def ) {
			return CKEDITOR.tools.extend( def || {}, {
				contextSensitive: 1,
				refresh: function( editor, path ) {
					this.setState( path.contains( 'chart', 1 ) ? CKEDITOR.TRISTATE_OFF : CKEDITOR.TRISTATE_DISABLED );
				}
			});
		}

		editor.addCommand( 'chartProperties', new CKEDITOR.dialogCommand( 'chartProperties', createDef() ) );
		editor.addCommand( 'chartDelete', createDef({
			exec: function( editor ) {
				var path = editor.elementPath(),
					chart = path.contains( 'chart', 1 );

				if ( !chart )
					return;

				// If the chart's parent has only one child remove it as well (unless it's the body or a chart cell) (#5416, #6289)
				var parent = chart.getParent();
				if ( parent.getChildCount() == 1 && !parent.is( 'body', 'td', 'th' ) )
					chart = parent;

				var range = editor.createRange();
				range.moveToPosition( chart, CKEDITOR.POSITION_BEFORE_START );
				chart.remove();
				range.select();
			}
		}));

		editor.ui.addButton && editor.ui.addButton( 'chart', {
			label: lang.toolbar,
			command: 'chart',
			toolbar: 'insert,30'
		});

		CKEDITOR.dialog.add( 'chart', this.path + 'dialogs/chart.js' );
		CKEDITOR.dialog.add( 'chartProperties', this.path + 'dialogs/chart.js' );

		// If the "menu" plugin is loaded, register the menu items.
		if ( editor.addMenuItems ) {
			editor.addMenuItems({
				chart: {
					label: lang.menu,
					command: 'chartProperties',
					group: 'chart',
					order: 5
				},

				chartdelete: {
					label: lang.deletechart,
					command: 'chartDelete',
					group: 'chart',
					order: 1
				}
			});
		}

		editor.on( 'doubleclick', function( evt ) {
			var element = evt.data.element;

			if ( element.is( 'chart' ) )
				evt.data.dialog = 'chartProperties';
		});

		// If the "contextmenu" plugin is loaded, register the listeners.
		if ( editor.contextMenu ) {
			editor.contextMenu.addListener( function() {
				// menu item state is resolved on commands.
				return {
					chartdelete: CKEDITOR.TRISTATE_OFF,
					chart: CKEDITOR.TRISTATE_OFF
				};
			});
		}
	}
});