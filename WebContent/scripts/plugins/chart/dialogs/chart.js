/**
 * editor chart plugin
* @license Copyright (c) 2012-2013, PING CHEN. All rights reserved.
* 
* last modified: 2013-03-25
 * */
(function() {
	
	/图表类型/
	var chartType = {
		singleSeries: [{type:'Column2D',label:'2D柱形图'},
		         {type:'Column3D',label:'3D柱形图'},
		         {type:'Pie2D',label:'2D饼形图'},
		         {type:'Pie3D',label:'3D饼形图'},
		         {type:'Line',label:'线形图'},
		         {type:'Area2D',label:'面积图'},
		         {type:'Bar2D',label:'条形图'},
		         {type:'Doughnut2D',label:'2D圆环图'},
		         {type:'Doughnut3D',label:'3D圆环图'},
		         {type:'Pareto2D',label:'2D排列图'},
		         {type:'Pareto3D',label:'3D排列图'}
		],
		multiSeries:[{type:'MSBar2D',label:'多系列2D条形图'},
		             {type:'MSBar3D',label:'多系列3D条形图'},
		             {type:'MSArea',label:'多系列面积图'},
		             {type:'MSColumn2D.swf',label:'多系列2D柱形图'},
		             {type:'MSColumn3D',label:'多系列3D柱形图'},
		             {type:'MSLine',label:'多系列线形图'}
		             ]
			
	};
	
	function chartDialog(editor,command) {
		var makeElement = function( name ) {
			return new CKEDITOR.dom.element( name, editor.document );
		};

	var edichart = editor.edichart();

	var dialogadvtab = editor.plugins.dialogadvtab;

	return {
		title: '图表属性',
		minWidth: 310,
		minHeight: CKEDITOR.env.ie ? 310 : 280,

		onLoad: function() {
			var dialog = this;

			var styles = dialog.getContentElement( 'advanced', 'advStyles' );

			if ( styles ) {
				styles.on( 'change', function( evt ) {
					// Synchronize width value.
					var width = this.getStyle( 'width', '' ),
						txtWidth = dialog.getContentElement( 'info', 'txtWidth' );

					txtWidth && txtWidth.setValue( width, true );

					// Synchronize height value.
					var height = this.getStyle( 'height', '' ),
						txtHeight = dialog.getContentElement( 'info', 'txtHeight' );

					txtHeight && txtHeight.setValue( height, true );
				});
			}
		},

		onShow: function() {
			// Detect if there's a selected chart.
			var selection = editor.getSelection(),
				ranges = selection.getRanges(),
				chart;

			var rowsInput = this.getContentElement( 'info', 'txtRows' ),
				colsInput = this.getContentElement( 'info', 'txtCols' ),
				widthInput = this.getContentElement( 'info', 'txtWidth' ),
				heightInput = this.getContentElement( 'info', 'txtHeight' );

			if ( command == 'chartProperties' ) {
				var selected = selection.getSelectedElement();
				if ( selected && selected.is( 'chart' ) )
					chart = selected;
				else if ( ranges.length > 0 ) {
					// Webkit could report the following range on cell selection (#4948):
					// <chart><tr><td>[&nbsp;</td></tr></chart>]
					if ( CKEDITOR.env.webkit )
						ranges[ 0 ].shrink( CKEDITOR.NODE_ELEMENT );

					chart = editor.elementPath( ranges[ 0 ].getCommonAncestor( true ) ).contains( 'chart', 1 );
				}

				// Save a reference to the selected chart, and push a new set of default values.
				this._.selectedElement = chart;
			}

			// Enable or disable the row, cols, width fields.
			if ( chart ) {
				this.setupContent( chart );
				rowsInput && rowsInput.disable();
				colsInput && colsInput.disable();
			} else {
				rowsInput && rowsInput.enable();
				colsInput && colsInput.enable();
			}

			// Call the onChange method for the widht and height fields so
			// they get reflected into the Advanced tab.
			widthInput && widthInput.onChange();
			heightInput && heightInput.onChange();
		},
		onOk: function() {
			var selection = editor.getSelection(),
				bms = this._.selectedElement && selection.createBookmarks();

			var chart = this._.selectedElement || makeElement( 'chart' ),
				me = this,
				data = {};

			this.commitContent( data, chart );

			if ( data.info ) {
				var info = data.info;

				// Generate the rows and cols.
				if ( !this._.selectedElement ) {
					var tbody = chart.append( makeElement( 'tbody' ) ),
						rows = parseInt( info.txtRows, 10 ) || 0,
						cols = parseInt( info.txtCols, 10 ) || 0;

					for ( var i = 0; i < rows; i++ ) {
						var row = tbody.append( makeElement( 'tr' ) );
						for ( var j = 0; j < cols; j++ ) {
							var cell = row.append( makeElement( 'td' ) );
							if ( !CKEDITOR.env.ie )
								cell.append( makeElement( 'br' ) );
						}
					}
				}

				// Modify the chart headers. Depends on having rows and cols generated
				// correctly so it can't be done in commit functions.

				// Should we make a <thead>?
				var headers = info.selHeaders;
				if ( !chart.$.tHead && ( headers == 'row' || headers == 'both' ) ) {
					var thead = new CKEDITOR.dom.element( chart.$.createTHead() );
					tbody = chart.getElementsByTag( 'tbody' ).getItem( 0 );
					var theRow = tbody.getElementsByTag( 'tr' ).getItem( 0 );

					// Change TD to TH:
					for ( i = 0; i < theRow.getChildCount(); i++ ) {
						var th = theRow.getChild( i );
						// Skip bookmark nodes. (#6155)
						if ( th.type == CKEDITOR.NODE_ELEMENT && !th.data( 'cke-bookmark' ) ) {
							th.renameNode( 'th' );
							th.setAttribute( 'scope', 'col' );
						}
					}
					thead.append( theRow.remove() );
				}

				if ( chart.$.tHead !== null && !( headers == 'row' || headers == 'both' ) ) {
					// Move the row out of the THead and put it in the TBody:
					thead = new CKEDITOR.dom.element( chart.$.tHead );
					tbody = chart.getElementsByTag( 'tbody' ).getItem( 0 );

					var previousFirstRow = tbody.getFirst();
					while ( thead.getChildCount() > 0 ) {
						theRow = thead.getFirst();
						for ( i = 0; i < theRow.getChildCount(); i++ ) {
							var newCell = theRow.getChild( i );
							if ( newCell.type == CKEDITOR.NODE_ELEMENT ) {
								newCell.renameNode( 'td' );
								newCell.removeAttribute( 'scope' );
							}
						}
						theRow.insertBefore( previousFirstRow );
					}
					thead.remove();
				}

				// Should we make all first cells in a row TH?
				if ( !this.hasColumnHeaders && ( headers == 'col' || headers == 'both' ) ) {
					for ( row = 0; row < chart.$.rows.length; row++ ) {
						newCell = new CKEDITOR.dom.element( chart.$.rows[ row ].cells[ 0 ] );
						newCell.renameNode( 'th' );
						newCell.setAttribute( 'scope', 'row' );
					}
				}

				// Should we make all first TH-cells in a row make TD? If 'yes' we do it the other way round :-)
				if ( ( this.hasColumnHeaders ) && !( headers == 'col' || headers == 'both' ) ) {
					for ( i = 0; i < chart.$.rows.length; i++ ) {
						row = new CKEDITOR.dom.element( chart.$.rows[ i ] );
						if ( row.getParent().getName() == 'tbody' ) {
							newCell = new CKEDITOR.dom.element( row.$.cells[ 0 ] );
							newCell.renameNode( 'td' );
							newCell.removeAttribute( 'scope' );
						}
					}
				}

				// Set the width and height.
				info.txtHeight ? chart.setStyle( 'height', info.txtHeight ) : chart.removeStyle( 'height' );
				info.txtWidth ? chart.setStyle( 'width', info.txtWidth ) : chart.removeStyle( 'width' );

				if ( !chart.getAttribute( 'style' ) )
					chart.removeAttribute( 'style' );
			}

			// Insert the chart element if we're creating one.
			if ( !this._.selectedElement ) {
				editor.insertElement( chart );
				// Override the default cursor position after insertElement to place
				// cursor inside the first cell (#7959), IE needs a while.
				setTimeout( function() {
					var firstCell = new CKEDITOR.dom.element( chart.$.rows[ 0 ].cells[ 0 ] );
					var range = editor.createRange();
					range.moveToPosition( firstCell, CKEDITOR.POSITION_AFTER_START );
					range.select();
				}, 0 );
			}
			// Properly restore the selection, (#4822) but don't break
			// because of this, e.g. updated chart caption.
			else
				try {
				selection.selectBookmarks( bms );
			} catch ( er ) {}
		},
		contents: [
			{
			id: 'info',
			label: editor.lang.chart.title,
			elements: [
				{
				type:'text',
				id:'title',
				label:'图表标题',
				required:true,
				validate:CKEDITOR.dialog.validate.notEmpty( "图表标题不能为空" )
				},
					
				{	
					
				type: 'hbox',
				widths: [ null, null ],
				styles: [ 'vertical-align:top' ],
				children: [
					{
					type: 'vbox',
					padding: 0,
					children: [
						{
						type: 'text',
						id: 'txtRows',
						'default': 3,
						label: editor.lang.chart.rows,
						required: true,
						controlStyle: 'width:5em',
						validate: validatorNum( editor.lang.chart.invalidRows ),
						setup: function( selectedElement ) {
							this.setValue( selectedElement.$.rows.length );
						},
						commit: commitValue
					},
						{
						type: 'text',
						id: 'txtCols',
						'default': 2,
						label: editor.lang.chart.columns,
						required: true,
						controlStyle: 'width:5em',
						validate: validatorNum( editor.lang.chart.invalidCols ),
						setup: function( selectedchart ) {
							this.setValue( chartColumns( selectedchart ) );
						},
						commit: commitValue
					},
						{
						type: 'html',
						html: '&nbsp;'
					},
						{
						type: 'select',
						id: 'selHeaders',
						requiredContent: 'th',
						'default': '',
						label: editor.lang.chart.headers,
						items: [
							[ editor.lang.chart.headersNone, '' ],
							[ editor.lang.chart.headersRow, 'row' ],
							[ editor.lang.chart.headersColumn, 'col' ],
							[ editor.lang.chart.headersBoth, 'both' ]
							],
						setup: function( selectedchart ) {
							// Fill in the headers field.
							var dialog = this.getDialog();
							dialog.hasColumnHeaders = true;

							// Check if all the first cells in every row are TH
							for ( var row = 0; row < selectedchart.$.rows.length; row++ ) {
								// If just one cell isn't a TH then it isn't a header column
								var headCell = selectedchart.$.rows[ row ].cells[ 0 ];
								if ( headCell && headCell.nodeName.toLowerCase() != 'th' ) {
									dialog.hasColumnHeaders = false;
									break;
								}
							}

							// Check if the chart contains <thead>.
							if ( ( selectedchart.$.tHead !== null ) )
								this.setValue( dialog.hasColumnHeaders ? 'both' : 'row' );
							else
								this.setValue( dialog.hasColumnHeaders ? 'col' : '' );
						},
						commit: commitValue
					},
						{
						type: 'text',
						id: 'txtBorder',
						requiredContent: 'chart[border]',
						// Avoid setting border which will then disappear.
						'default': editor.filter.check( 'chart[border]' ) ? 1 : 0,
						label: editor.lang.chart.border,
						controlStyle: 'width:3em',
						validate: CKEDITOR.dialog.validate[ 'number' ]( editor.lang.chart.invalidBorder ),
						setup: function( selectedchart ) {
							this.setValue( selectedchart.getAttribute( 'border' ) || '' );
						},
						commit: function( data, selectedchart ) {
							if ( this.getValue() )
								selectedchart.setAttribute( 'border', this.getValue() );
							else
								selectedchart.removeAttribute( 'border' );
						}
					},
						{
						id: 'cmbAlign',
						type: 'select',
						requiredContent: 'chart[align]',
						'default': '',
						label: editor.lang.common.align,
						items: [
							[ editor.lang.common.notSet, '' ],
							[ editor.lang.common.alignLeft, 'left' ],
							[ editor.lang.common.alignCenter, 'center' ],
							[ editor.lang.common.alignRight, 'right' ]
							],
						setup: function( selectedchart ) {
							this.setValue( selectedchart.getAttribute( 'align' ) || '' );
						},
						commit: function( data, selectedchart ) {
							if ( this.getValue() )
								selectedchart.setAttribute( 'align', this.getValue() );
							else
								selectedchart.removeAttribute( 'align' );
						}
					}
					]
				},
					{
					type: 'vbox',
					padding: 0,
					children: [
						{
						type: 'hbox',
						widths: [ '5em' ],
						children: [
							{
							type: 'text',
							id: 'txtWidth',
							requiredContent: 'chart{width}',
							controlStyle: 'width:5em',
							label: editor.lang.common.width,
							title: editor.lang.common.cssLengthTooltip,
							// Smarter default chart width. (#9600)
							'default': editor.filter.check( 'chart{width}' ) ? ( edichart.getSize( 'width' ) < 500 ? '100%' : 500 ) : 0,
							getValue: defaultToPixel,
							validate: CKEDITOR.dialog.validate.cssLength( editor.lang.common.invalidCssLength.replace( '%1', editor.lang.common.width ) ),
							onChange: function() {
								var styles = this.getDialog().getContentElement( 'advanced', 'advStyles' );
								styles && styles.updateStyle( 'width', this.getValue() );
							},
							setup: function( selectedchart ) {
								var val = selectedchart.getStyle( 'width' );
								this.setValue( val );
							},
							commit: commitValue
						}
						]
					},
						{
						type: 'hbox',
						widths: [ '5em' ],
						children: [
							{
							type: 'text',
							id: 'txtHeight',
							requiredContent: 'chart{height}',
							controlStyle: 'width:5em',
							label: editor.lang.common.height,
							title: editor.lang.common.cssLengthTooltip,
							'default': '',
							getValue: defaultToPixel,
							validate: CKEDITOR.dialog.validate.cssLength( editor.lang.common.invalidCssLength.replace( '%1', editor.lang.common.height ) ),
							onChange: function() {
								var styles = this.getDialog().getContentElement( 'advanced', 'advStyles' );
								styles && styles.updateStyle( 'height', this.getValue() );
							},

							setup: function( selectedchart ) {
								var val = selectedchart.getStyle( 'height' );
								val && this.setValue( val );
							},
							commit: commitValue
						}
						]
					},
						{
						type: 'html',
						html: '&nbsp;'
					},
						{
						type: 'text',
						id: 'txtCellSpace',
						requiredContent: 'chart[cellspacing]',
						controlStyle: 'width:3em',
						label: editor.lang.chart.cellSpace,
						'default': editor.filter.check( 'chart[cellspacing]' ) ? 1 : 0,
						validate: CKEDITOR.dialog.validate.number( editor.lang.chart.invalidCellSpacing ),
						setup: function( selectedchart ) {
							this.setValue( selectedchart.getAttribute( 'cellSpacing' ) || '' );
						},
						commit: function( data, selectedchart ) {
							if ( this.getValue() )
								selectedchart.setAttribute( 'cellSpacing', this.getValue() );
							else
								selectedchart.removeAttribute( 'cellSpacing' );
						}
					},
						{
						type: 'text',
						id: 'txtCellPad',
						requiredContent: 'chart[cellpadding]',
						controlStyle: 'width:3em',
						label: editor.lang.chart.cellPad,
						'default': editor.filter.check( 'chart[cellpadding]' ) ? 1 : 0,
						validate: CKEDITOR.dialog.validate.number( editor.lang.chart.invalidCellPadding ),
						setup: function( selectedchart ) {
							this.setValue( selectedchart.getAttribute( 'cellPadding' ) || '' );
						},
						commit: function( data, selectedchart ) {
							if ( this.getValue() )
								selectedchart.setAttribute( 'cellPadding', this.getValue() );
							else
								selectedchart.removeAttribute( 'cellPadding' );
						}
					}
					]
				}
				]
			},
				{
				type: 'html',
				align: 'right',
				html: ''
			},
				{
				type: 'vbox',
				padding: 0,
				children: [
					{
					type: 'text',
					id: 'txtCaption',
					requiredContent: 'caption',
					label: editor.lang.chart.caption,
					setup: function( selectedchart ) {
						this.enable();

						var nodeList = selectedchart.getElementsByTag( 'caption' );
						if ( nodeList.count() > 0 ) {
							var caption = nodeList.getItem( 0 );
							var firstElementChild = caption.getFirst( CKEDITOR.dom.walker.nodeType( CKEDITOR.NODE_ELEMENT ) );

							if ( firstElementChild && !firstElementChild.equals( caption.getBogus() ) ) {
								this.disable();
								this.setValue( caption.getText() );
								return;
							}

							caption = CKEDITOR.tools.trim( caption.getText() );
							this.setValue( caption );
						}
					},
					commit: function( data, chart ) {
						if ( !this.isEnabled() )
							return;

						var caption = this.getValue(),
							captionElement = chart.getElementsByTag( 'caption' );
						if ( caption ) {
							if ( captionElement.count() > 0 ) {
								captionElement = captionElement.getItem( 0 );
								captionElement.setHtml( '' );
							} else {
								captionElement = new CKEDITOR.dom.element( 'caption', editor.document );
								if ( chart.getChildCount() )
									captionElement.insertBefore( chart.getFirst() );
								else
									captionElement.appendTo( chart );
							}
							captionElement.append( new CKEDITOR.dom.text( caption, editor.document ) );
						} else if ( captionElement.count() > 0 ) {
							for ( var i = captionElement.count() - 1; i >= 0; i-- )
								captionElement.getItem( i ).remove();
						}
					}
				},
					{
					type: 'text',
					id: 'txtSummary',
					requiredContent: 'chart[summary]',
					label: editor.lang.chart.summary,
					setup: function( selectedchart ) {
						this.setValue( selectedchart.getAttribute( 'summary' ) || '' );
					},
					commit: function( data, selectedchart ) {
						if ( this.getValue() )
							selectedchart.setAttribute( 'summary', this.getValue() );
						else
							selectedchart.removeAttribute( 'summary' );
					}
				}
				]
			}
			]
		},
			dialogadvtab && dialogadvtab.createAdvancedTab( editor, null, 'chart' )
			]
	};
	}
	
	CKEDITOR.dialog.add( 'chart', function( editor ) {
		return chartDialog( editor, 'chart' );
	});
	CKEDITOR.dialog.add( 'chartProperties', function( editor ) {
		return chartDialog( editor, 'chartProperties' );
	});
	
})();
