<table border="0" cellspacing="5" cellpadding="5">
    <tbody>
        <tr>
            <td>Minimum Date:</td>
            <td><input name="min" id="min" type="text"></td>
        </tr>
        <tr>
            <td>Maximum Date:</td>
            <td><input name="max" id="max" type="text"></td>
        </tr>
    </tbody>
</table>

<?php 
    $headers = '<tr>
        <th>ID</th>
        <th>Amount</th>
        <th>Buyer</th>
        <th>Receipt ID</th>
        <th>Items</th>
        <th>Buyer Email</th>
        <th>Buyer IP</th>
        <th>Note</th>
        <th>City</th>
        <th>Phone</th>
        <th>Hash Key</th>
        <th>Entry At</th>
    </tr>';
?>
<table width="100%" class="display" id="example" cellspacing="0">
    <thead><?=$headers?></thead>
    <tfoot><?=$headers?></tfoot>
    <tbody>
        <?php if(count($data['forms']) > 0) : ?>
            <?php foreach($data['forms'] as $form) : ?>
                <tr>
                    <td><?=$form->id?></td>
                    <td><?=$form->amount?></td>
                    <td><?=$form->buyer?></td>
                    <td><?=$form->receipt_id?></td>
                    <td><?=$form->items?></td>
                    <td><?=$form->buyer_email?></td>
                    <td><?=$form->buyer_ip?></td>
                    <td><?=$form->note?></td>
                    <td><?=$form->city?></td>
                    <td><?=$form->phone?></td>
                    <td><?=ht($form->hash_key, 20)?></td>
                    <td><?=date("d M Y", strtotime($form->entry_at))?></td>
                </tr>
            <?php endforeach; ?>
        <?php endif; ?>                
    </tbody>
</table>