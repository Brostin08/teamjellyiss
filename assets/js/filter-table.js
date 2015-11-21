jQuery(document).ready(function(){
    jQuery('.filterable .btn-filter').click(function(){
        var jQuerypanel = jQuery(this).parents('.filterable'),
        jQueryfilters = jQuerypanel.find('.filters input'),
        jQuerytbody = jQuerypanel.find('.table tbody');
        if (jQueryfilters.prop('disabled') == true) {
            jQueryfilters.prop('disabled', false);
            jQueryfilters.first().focus();
        } else {
            jQueryfilters.val('').prop('disabled', true);
            jQuerytbody.find('.no-result').remove();
            jQuerytbody.find('tr').show();
        }
    });

    jQuery('.filterable .filters input').keyup(function(e){
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code == '9') return;
        /* Useful DOM data and selectors */
        var jQueryinput = jQuery(this),
        inputContent = jQueryinput.val().toLowerCase(),
        jQuerypanel = jQueryinput.parents('.filterable'),
        column = jQuerypanel.find('.filters th').index(jQueryinput.parents('th')),
        jQuerytable = jQuerypanel.find('.table'),
        jQueryrows = jQuerytable.find('tbody tr');
        /* Dirtiest filter function ever ;) */
        var jQueryfilteredRows = jQueryrows.filter(function(){
            var value = jQuery(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        jQuerytable.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        jQueryrows.show();
        jQueryfilteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if (jQueryfilteredRows.length === jQueryrows.length) {
            jQuerytable.find('tbody').prepend(jQuery('<tr class="no-result text-center"><td colspan="'+ jQuerytable.find('.filters th').length +'">No result found</td></tr>'));
        }
    });
});